require 'cucumber/rails'
require 'coveralls'
Coveralls.wear_merged!('rails')

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Warden.test_mode!
World Warden::Test::Helpers
After { Warden.test_reset! }

Cucumber::Rails::Database.javascript_strategy = :truncation

