require 'rails_helper'

RSpec.describe "Article", type: :feature do
    describe 'add a new article' do
        before do
            Category.create(name: 'Tech', priority: 1)
            User.create(name: 'Qoosim', email: 'qoosim@gmail.com',
                        password: 'password', password_confirmation: 'password')
        end
        it 'login then create an article' do
            visit root_path
            click_on 'Sign in'
            fill_in 'Email',	with: 'qoosim@gmail.com'
            fill_in 'Password',	with: 'password'
            click_on 'Login'
            expect(page).to have_content('No Article created!')
            
            sleep(3)
            click_on 'New Article'

            expect(page).to have_content('New Article')
            
            fill_in('article[title]', with: 'Rails')

            fill_in('article[text]', with: 'Awesome framework')

            find('form input[type=file]').set('./spec/image/splash7.jpg')
            
            click_on 'Create'

            expect(page).to have_content('Awesome framework')  
        end
        
    end
end
