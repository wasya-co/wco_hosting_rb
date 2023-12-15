require_relative "lib/wco_email/version"

Gem::Specification.new do |spec|
  spec.name        = "wco_email"
  spec.version     = WcoEmail::VERSION
  spec.authors     = [ "Victor Pudeyev" ]
  spec.email       = ["victor@wasya.co"]
  spec.homepage    = "https://wasya.co"
  spec.summary     = "https://wasya.co"
  spec.description = "https://wasya.co"
  spec.license     = "Proprietary"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://wasya.co"
  spec.metadata["changelog_uri"]   = "https://wasya.co"

  spec.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.txt"]

  spec.add_dependency "rails",     "~> 6.1.0"
  spec.add_dependency "haml",      "~> 6.3.0"
  spec.add_dependency "cancancan", "~> 3.5.0"

  spec.add_dependency 'devise',    "~> 4.9.3" # for testing

  spec.add_dependency 'ish_models', "~> 3.1.0.3"

  spec.add_dependency 'mongoid',           '~> 7.3.0'
  spec.add_dependency 'mongoid_paranoia',  '~> 0.6.0'
  spec.add_dependency 'mongoid-autoinc',   '~> 6.0.3'
  spec.add_dependency 'mongoid-paperclip', '~> 0.1.0'
  spec.add_dependency 'kaminari-mongoid',  '~> 1.0.1'



end
