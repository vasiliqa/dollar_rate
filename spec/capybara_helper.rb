require 'capybara/rspec'
require 'rails_helper'
require 'capybara-screenshot/rspec'
require 'capybara/poltergeist'

# Capybara.javascript_driver = :selenium
Capybara.javascript_driver = :poltergeist
Capybara.server = :puma

Capybara.default_max_wait_time = 10
