require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "new account"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'user-email', :with => "testing@email.com"
      fill_in 'user-password', :with => "biscuits"
      click_on "Sign up"
    end

    scenario "redirects to bands index page after signup" do
      expect(page).to have_content('All the Bands')
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'user-email', :with => "testing@email.com"
      click_on "Sign up"
    end

    scenario "re-renders the signup page after failed signup" do
      expect(current_path).to eq("/users/new")
      expect(page).to have_content("new account")
    end
  end

end
