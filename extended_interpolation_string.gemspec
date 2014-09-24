# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extended_interpolation_string/version'

Gem::Specification.new do |spec|
  spec.name          = "extended_interpolation_string"
  spec.version       = ExtendedInterpolationString::VERSION
  spec.authors       = ["Tomas Valent"]
  spec.email         = ["equivalent@eq8.eu"]
  spec.summary       = %q{Extended string interpolation}
  spec.description   = 'when interpolating string with hash that includes lamda,' +
                       'you can pass interpolator object upon which the lambda is ' +
                       'called before interpolating'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.1'

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
