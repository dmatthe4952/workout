require 'rails_helper'

RSpec.feature "listing exercises" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    @sarah = User.create(email: "sarah@example.com", password: "password", first_name: "Sarah", last_name: "Doe")
    login_as(@john)
    
    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Workout 1", workout_date: 6.days.ago)
    @e2 = @john.exercises.create(duration_in_min: 60, workout: "Workout 2", workout_date: 5.days.ago)
    
    @following = Friendship.create(user: @john, friend: @sarah)
  end
  
  scenario "shows user's workouts for last 7 days " do
    visit "/"
    
    click_link "My Lounge"
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end
  
  scenario "shows user's friends" do
    visit "/"
    
    click_link "My Lounge"
    
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@sarah.full_name)
    expect(page).to have_link("Unfollow")
  end

end