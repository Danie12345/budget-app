require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  let(:user) { build(:user) }
  
  context 'visit get started page' do
    before(:example) do
      visit get_started_path
    end

    it 'shows the log in button' do
      expect(page).to have_content('Log In')
    end

    it 'shows the sign up button' do
      expect(page).to have_content('Sign Up')
    end

    it 'redirects to the sign up page' do
      click_on('Sign Up')
      expect(page).to have_current_path(new_user_registration_path)
    end

    it 'redirects to the log in page' do
      click_on('Log In')
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  describe 'register new user' do
    context 'navigate to register user page' do
      before(:example) do
        visit new_user_registration_path
      end

      it 'shows the page title' do
        expect(page).to have_content('Register')
      end

      it 'shows the name input field' do
        expect(page).to have_field('Name')
      end

      it 'shows the email input field' do
        expect(page).to have_field('Email')
      end

      it 'shows the password input field' do
        expect(page).to have_field('Password')
      end

      it 'shows the password confirmation input field' do
        expect(page).to have_field('Password confirmation')
      end

      it 'shows the sign up button' do
        expect(page).to have_button('Sign up')
      end

      it 'shows the link to go to login page' do
        expect(page).to have_link('Log in')
      end

      it 'shows the link to send confirmation instructions' do
        expect(page).to have_link('receive confirmation instructions')
      end

      it 'redirects to the home page when the user fills in the fields and clicks the sign up button' do
        fill_in 'Name', with: user.name
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        fill_in 'Password confirmation', with: user.password
        click_button 'Sign up'
        User.last.confirm
        expect(page).to have_current_path(new_user_session_path)
        expect(user.name).to eq(User.last.name)
      end

      it 'redirects to the home page when the user doesn\'t feel like it' do
        click_on 'Log in'
        expect(page).to have_current_path(new_user_session_path)
      end

      it 'redirects to the resend confirmation instructions page' do
        click_on 'receive confirmation instructions'
        expect(page).to have_current_path(new_user_confirmation_path)
      end
    end
  end

  describe 'log in' do
    context 'navigation' do
      before(:example) do
        visit new_user_session_path
      end

      it 'shows the page title' do
        expect(page).to have_content('Log in')
      end

      it 'shows the email input field' do
        expect(page).to have_field('Email')
      end

      it 'shows the password input field' do
        expect(page).to have_field('Password')
      end

      it 'shows the remember me checkbox field' do
        expect(page).to have_field('Remember me')
      end

      it 'shows the log in button' do
        expect(page).to have_button('Log in')
      end

      it 'shows the link to go to sign up page' do
        expect(page).to have_link('Sign up')
      end

      it 'shows the link to forgot your password page' do
        expect(page).to have_link('Forgot your password?')
      end

      it 'shows the link to send confirmation instructions' do
        expect(page).to have_link('receive confirmation instructions')
      end

      it 'redirects to the home page when the user fills in the fields and clicks the log in button' do
        client = create(:user)
        client.confirm
        fill_in 'Email', with: client.email
        fill_in 'Password', with: client.password
        click_button 'Log in'
        expect(page).to have_current_path(root_path)
      end

      it 'redirects to the sign up page when the user doesn\'t feel like it' do
        click_on 'Sign up'
        expect(page).to have_current_path(new_user_registration_path)
      end

      it 'redirects to the forgot your password page' do
        click_on 'Forgot your password?'
        expect(page).to have_current_path(new_user_password_path)
      end

      it 'redirects to the resend confirmation instructions page' do
        click_on 'receive confirmation instructions'
        expect(page).to have_current_path(new_user_confirmation_path)
      end
    end
  end
end
