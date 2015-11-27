require 'rails_helper'

RSpec.feature "Following users" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@exsample.com", password: "password") 
    @joe = User.create(first_name: "Joe", last_name: "Doe", email: "joe@exsample.com", password: "password") 
    login_as(@john)
  end
  
  scenario "if login succeeds"  do
    
    visit "/"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@joe.full_name)
    expect(page).not_to have_link("Follow", :href=>"/friendships?friend_id=#{@john.id}")
    
    link = "a[href='/friendships?friend_id=#{@joe.id}']"
    
    find(link).click
    expect(page).not_to have_link("Follow", :href=>"/friendships?friend_id=#{@joe.id}")
    
    
  end
  
end