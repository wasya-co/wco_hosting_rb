
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', "~> 6.1.0"
  gem 'rails-controller-testing', "~> 1.0.5"
  gem 'factory_bot_rails'

  gem 'wco_models',  github: 'wasya-co/wco_models',     branch: '3.1.0'

  gem 'omniauth',                       '~> 2.1.1'
  gem "omniauth-keycloak",              "~> 1.5.1"
  gem "omniauth-rails_csrf_protection", "~> 1.0.1"

  gem 'irb', '>= 1.2.8'

end

