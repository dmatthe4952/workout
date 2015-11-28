require "rails_helper"

RSpec.feature "Unfollowing a Friend" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@exsample.com", password: "password") 
    @joe = User.create(first_name: "Joe", last_name: "Doe", email: "joe@exsample.com", password: "password") 
    
    @follow = Friendship.create(user: @john, friend: @joe)
    
    login_as(@john)
  end
  
  scenario "when logged in" do
    visit "/"
    
    click_link "My Lounge"
    
    link = "a[href= '/friendships/#{@follow.id}'][data-method='delete']"
    
    find(link).click

    expect(page).to have_content(@joe.full_name + ' unfollowed')
  end
  
end