require 'rails_helper'

RSpec.feature "User Sign Out" do

  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
  end

  scenario "with valid credentials" do

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@john.email}")

    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("Signed in as")
    expect(current_path).to eq(root_path)
  end
end