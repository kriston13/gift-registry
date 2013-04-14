source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'pry'
gem 'pry-doc'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'rspec-rails', "~> 2.0"
end

gem 'enumerated_attribute'
gem 'money-rails'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

#gem "factory_girl_rails", "~> 4.0"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :test do
    gem 'rspec-rails', "~> 2.0"
    gem 'capybara'
    gem 'capybara-webkit'
    gem 'factory_girl_rails', " ~> 4.0"
    gem 'launchy'
    gem "guard-rspec"
    gem 'database_cleaner'
    gem 'rb-fsevent', :require=>false if RUBY_PLATFORM =~ /darwin/i
    gem 'terminal-notifier-guard'
    gem 'guard-livereload'
    gem 'debugger'
    gem 'capybara-screenshot'
    gem 'timecop'
end

