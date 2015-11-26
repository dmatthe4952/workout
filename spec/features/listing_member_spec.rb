require 'rails_helper'

RSpec.feature "Listing Members" do
  
  before do
    @john = User.create( first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "passowrd" )
    @sarah = User.create( first_name: "Sarah", last_name: "Joseph", email: "sarah@example.com", password: "passowrd" )
  end
  
  scenario "" do
    
    visit "/"
    
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)

    
  end
end