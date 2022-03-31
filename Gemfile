source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '2.6.5'

gem 'async-websocket', '~>0.8.0'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dotenv-rails', '~> 2.7.5'
gem 'google-api-client', '~> 0.34'
gem 'health_check'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.6'
gem 'rails', '~> 6.0.2'
gem 'sass-rails', '~> 5'
# gem 'slack-ruby-bot', '0.12.0'
gem 'slack-ruby-client'
gem 'sqlite3', '~> 1.4'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'

  gem 'annotate'
  gem 'awesome_print'
  gem 'factory_bot', '5.1.1'
  gem 'factory_bot_rails', '5.1.1'
  gem 'guard-rspec', '4.7.3', require: false
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'

  gem 'cap-gce'
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq'
  gem 'capistrano-yarn'
  gem 'capistrano3-nginx'
  gem 'capistrano3-puma', require: false
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'

  gem 'guard'
  gem 'ordinare'
  gem 'rspec-rails', '3.9.0'
  gem 'terminal-notifier-guard'

  # slack-ruby-bot
  gem 'rack-test'
  gem 'rspec'
  gem 'vcr'
  gem 'webmock'
end

# HTTP 통신
gem 'httparty', '~> 0.17.0'

# Schedule 작업
gem 'sidekiq', '5.2.8'
gem 'sidekiq-scheduler', '3.0.0'
gem 'redis'