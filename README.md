# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    - 2.6.5

* System dependencies
    - TBD

* Configuration
    - .env

* Database creation
    - `rails db:create`

* Database initialization
    - `rails db:migrate db:seed`

* How to run the test suite
    - `rails test`

* Services (job queues, cache servers, search engines, etc.)
    - TBD

* Deployment instructions
    - TBD

* Gems
    - dotenv-rails: .env for env variables
    - annotate: add comments in models, ... based on table
    - pry*: console & debuggin
    - ordinare: ordering Gemfile
    - guard, terminal-notifier-guard: test helper

* sample bot run
    - .env set SLACK_API_TOKEN value
    - `ruby lib/bot/pong_bot.rb`
