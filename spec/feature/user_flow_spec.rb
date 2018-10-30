require 'rails_helper'

RSpec.feature "New", :type => :feature do
  # happy path
  scenario "User creates a new account with valid details" do
    visit "/sign_up"
    fill_in "users[name]", :with => "Jolynn"
    fill_in "users[email]", :with => "jolynn@gmail.com"
    fill_in "users[password]", :with => "11111111"
    click_button "Save Users"
    expect(page).to have_text("Jolynn")
  end
  # edgy path
  scenario "User creates a new account with invalid email" do
    visit "/signup"
    fill_in "user[name]", :with => "Jolynn"
    fill_in "user[email]", :with => "gmail.com"
    fill_in "user[password]", :with => "11111111"
    click_button "Save Users"
    expect(page).to have_text("User Sign up Page")
  end
end