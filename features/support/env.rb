require "rubygems"
require "spork"

Spork.prefork do
  require 'cucumber/rails'

  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false

  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run { }

