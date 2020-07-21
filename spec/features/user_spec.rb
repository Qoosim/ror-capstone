require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'Sign up form' do
    it 'creates a new user' do
      visit new_user_path
      fill_in 'Name',	with: 'Qoosim'
      fill_in 'Email',	with: 'qoosim@gmail.com'
      fill_in 'Password',	with: 'password'
      fill_in 'Password confirmation',	with: 'password'
      click_on 'Sign up'
      sleep(3)
      expect(page).to have_content('No Article available')
    end
  end
end
