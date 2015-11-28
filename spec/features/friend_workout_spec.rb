require "rails_helper"

RSpec.feature "Friends Workout" do

  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @joe = User.create(first_name: "Joe", last_name: "Bazooka", email: "joe@example.com", password: "password")
    @follow = Friendship.create(user: @john, friend: @joe)
    
    @joe_exer = @joe.exercises.create(duration_in_min: 30, workout: "Cardio", workout_date: 6.days.ago)

    login_as(@john)
  end

  scenario "Shows friends workout" do
    visit "/"
    
    click_link "My Lounge"
    
    click_link(@joe.full_name)
    
    expect(page).to have_content(@joe.full_name + "'s Exercises")
    expect(page).to have_content("Duration")
    expect(page).to have_content("Workout Details")
    expect(page).to have_content("Activity Date")
    expect(page).to have_content(@joe_exer.duration_in_min)
    expect(page).to have_content(@joe_exer.workout)
    expect(page).to have_content(@joe_exer.workout_date)
    expect(page).to have_css("div#chart")
  end
end