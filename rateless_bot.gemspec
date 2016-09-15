# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rateless_bot/version'

Gem::Specification.new do |spec|
  spec.name          = "rateless_bot"
  spec.version       = RatelessBot::VERSION
  spec.authors       = ["Vincent Heuken"]
  spec.email         = ["me@vincentheuken.com"]

  spec.summary       = %q{An IRC Bot}
#  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/vheuken/rateless_bot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables  << 'rateless_bot'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "cinch", "2.3.2"
  spec.add_dependency "lastfm", "1.27.1"
  spec.add_dependency "open-weather", "~> 0.12"
  spec.add_dependency "video_info", "2.6.1"
  spec.add_dependency "countries", "1.2.5"
end
