require 'rails_helper'

RSpec.feature "Searching for user" do
  
  before do
    @john = User.create( first_name: "John", last_name: "Doe", email: "johndoe@example.com",
            password: "passowrd" )
    @sarah = User.create( first_name: "Sarah", last_name: "Doe", email: "sarah@example.com",
            password: "passowrd" )
  end
  scenario "with existing name should display all those users" do
    visit "/"
    
    fill_in "search_name", with: "Doe"
    click_button "Search"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(current_path).to eq("/dashboard/search")
    
  end
  
end

