source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Authentication
gem 'devise'
gem 'devise-jwt'

# Serializers
gem 'jsonapi-serializer'
gem 'active_model_serializers'

# JWT
gem 'jwt'

# Images
gem 'image_processing', '~> 1.2'

# CORS
gem 'rack-cors'

# Background Jobs
gem 'sidekiq'
gem 'redis'

# Speed
gem "bootsnap", require: false

# Deployment
gem "kamal", require: false

gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false

  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'database_cleaner-active_record'
end
