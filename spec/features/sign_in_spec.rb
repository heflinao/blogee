require 'spec_helper'

feature 'signing in.' do
	scenario 'Signing in via form' do
		user = FactoryGirl.create(:user)

		visit '/'
		click_link 'Sign in'
		fill_in 'Username', with: user.username
		fill_in 'Password', with: user.password
		fill_in 'Email', with: user.email
		click_button "Sign in"

		expect(page).to have_content("Signed in successfully")
	end
end
