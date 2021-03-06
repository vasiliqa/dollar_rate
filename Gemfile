source 'https://rubygems.org'
ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Slim is a template language whose goal is reduce the syntax
# to the essential parts without becoming cryptic
gem 'slim-rails'

# For ActiveJob support
gem 'sidekiq'

# Provides a clear syntax for writing and deploying cron jobs.
gem 'whenever', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'

  # rspec stuff
  #
  # testing framework for Rails
  gem 'rspec-rails'
  # ..is a fixtures replacement with a straightforward definition syntax
  gem 'factory_girl_rails'
  # implements the rspec command for Spring
  gem 'spring-commands-rspec'
  # Collection of testing matchers extracted from Shoulda
  gem 'shoulda-matchers'
  # ..is a code coverage analysis tool for Ruby
  gem 'simplecov', require: false
end

group :development do
  # Manage Procfile-based applications
  gem 'foreman', require: false
  # Listens to file modifications and notifies you about the changes.
  gem 'listen'
  # Annotate ActiveRecord models
  gem 'annotate'
  # Ruby static code analyzer
  gem 'rubocop', require: false
end

group :test do
  # Record your test suite's HTTP interactions and replay them during future test runs.
  gem 'vcr'
  gem 'webmock'

  # Acceptance test framework for web applications
  gem 'capybara'

  gem 'selenium-webdriver'

  gem 'poltergeist'

  # Automatically save screen shots when a Capybara scenario fails
  gem 'capybara-screenshot'

  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
