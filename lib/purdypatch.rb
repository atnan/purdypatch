require 'prettypatch/PrettyPatch'
require 'mail'

module PurdyPatch
  class CLI
    def self.start(*args)
      mail = Mail.read(args.first)
      parts = mail.parts.dup
      parts.each_with_index do |part, i|
        if (part.content_type =~ %r(text/x-patch))
          purdy = Mail::Part.new do
            content_type 'text/html; charset=UTF-8'
            body PrettyPatch.prettify(part.body.decoded)
          end
          mail.parts.insert(i, purdy)
        end
      end
      puts mail.to_s
    end
  end
end
