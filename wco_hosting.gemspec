
Gem::Specification.new do |spec|
  spec.name        = "wco_hosting"
  spec.version     = "0.0.0.20"
  spec.authors     = [ "Victor Pudeyev" ]
  spec.email       = ["victor@wasya.co"]
  spec.homepage    = "https://wasya.co"
  spec.summary     = "https://wasya.co"
  spec.description = "https://wasya.co"
  spec.license     = "Proprietary"

  ##
  ## Edit the template, not the gemspec!
  ##
  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://wasya.co"
  spec.metadata["changelog_uri"]   = "https://wasya.co"

  spec.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.txt"]

  spec.add_dependency "cancancan", "~> 3.5.0"

  spec.add_dependency 'devise',    "~> 4.9.3"

  spec.add_dependency "haml",      "~> 6.3.0"

  spec.add_dependency 'kaminari-mongoid',  '~> 1.0.1'

  spec.add_dependency 'mongoid',           '~> 7.3.0'
  spec.add_dependency 'mongoid_paranoia',  '~> 0.6.0'
  spec.add_dependency 'mongoid-autoinc',   '~> 6.0.3'
  spec.add_dependency 'mongoid-paperclip', '~> 0.1.0'

  spec.add_dependency 'net-ssh', "~> 7.2.0"
  spec.add_dependency 'net-scp', "~> 4.0.0"

  ## not needed, it's in wco_models
  # spec.add_dependency 'prawn'
  # spec.add_dependency 'prawn-table'

  spec.add_dependency "rails",     "~> 6.1.7"

  spec.add_dependency 'sass'
  spec.add_dependency 'sass-rails', '~> 6.0'
  spec.add_dependency 'stripe', "~> 10.4.0"

  spec.add_dependency 'wco_models', "~> 3.1"

end
