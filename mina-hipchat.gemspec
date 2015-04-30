# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/hipchat/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-hipchat"
  spec.version       = Mina::Hipchat::VERSION
  spec.authors       = ["Jakub Juszczak"]
  spec.email         = ["juszczak.j@googlemail.com"]

  spec.summary       = %q{HipChat notification for Mina Deploy}
  spec.description   = %q{Sending HipChat notifications for mina deploy}
  spec.homepage      = "https://github.com/apertureless/mina-hipchat"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
