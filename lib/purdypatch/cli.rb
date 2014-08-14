require 'cgi'
require 'mail'
require 'pathname'
require 'purdypatch/version'
require 'prettypatch/PrettyPatch'

module PurdyPatch
  class CLI
    def self.start(*args)
      if args.empty?
        puts "purdypatch expects one or more files created via `git format-patch --attach [ <since> | <revision range> ]`."
        exit
      end

      args.each do |arg|
        patch_mail_path = Pathname.new(arg)
        next unless patch_mail_path.exist?

        mail = Mail.read(patch_mail_path)

        purdified = false
        mail.parts.dup.each_with_index do |part, i|
          if part.content_type =~ %r(text/plain)
            mail.parts[i] = Mail::Part.new do
              content_type 'text/html; charset=UTF-8'
              body "<html><body><pre>--\n#{ CGI::escapeHTML part.body.decoded }</pre></body></html>"
            end

          elsif part.attachment? && part.content_type =~ %r(text/x-patch)
            purdy_part = Mail::Part.new do
              content_type 'text/html; charset=UTF-8'
              body PrettyPatch.prettify(part.body.decoded)
            end

            mail.parts.insert(i, purdy_part)
            mail.header['X-Formatter'] = "PurdyPatch-#{PurdyPatch::VERSION}"
            purdified = true
          end
        end

        mail.parts << Mail::Part.new do
          content_type 'text/plain; charset=UTF-8'
        end

        if purdified
          purdy_patch_mail_path = patch_mail_path.sub_ext('.purdypatch')
          File.open(purdy_patch_mail_path, File::CREAT | File::TRUNC | File::RDWR) do |f|
            f.write mail.to_s
          end
          puts %Q(Purdified patch email saved to "#{purdy_patch_mail_path}".)
        end

      end
    end
  end
end
