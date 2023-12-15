require_relative "lib/wco_email/version"

Gem::Specification.new do |spec|
  spec.name        = "wco_email"
  spec.version     = WcoEmail::VERSION
  spec.authors     = ["mac_a2141"]
  spec.email       = ["victor@piousbox.com"]
  spec.homepage    = "https://wasya.co"
  spec.summary     = "https://wasya.co"
  spec.description = "https://wasya.co"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://wasya.co"
  spec.metadata["changelog_uri"] = "https://wasya.co"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.0"

end
