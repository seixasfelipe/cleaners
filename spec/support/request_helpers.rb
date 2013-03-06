require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

def login(login, password)
  visit root_path
  within("#new_user") do
    fill_in 'Login', with: login
    fill_in 'Password', with: password
    click_link_or_button 'Sign in'
  end
end
