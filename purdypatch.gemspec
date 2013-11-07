# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'purdypatch/version'

Gem::Specification.new do |gem|
  gem.name          = "purdypatch"
  gem.version       = PurdyPatch::VERSION
  gem.authors       = ["Nathan de Vries"]
  gem.email         = ["nathan@atnan.com"]
  gem.description   = %q{A tool for improving the format of git-format-patch emails, making them easier to review.}
  gem.summary       = %q{Make your git-format-patch emails all purdy like.}
  gem.homepage      = "https://github.com/atnan/purdypatch"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib", "lib/prettypatch"]

  gem.add_dependency "mail"
end
