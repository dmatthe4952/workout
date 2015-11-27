require 'rails_helper'

RSpec.feature "listing exercises" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
    login_as(@john)
    
    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Workout 1", workout_date: 6.days.ago)
    @e2 = @john.exercises.create(duration_in_min: 60, workout: "Workout 2", workout_date: 5.days.ago)
  end
  
  scenario "with valid inputs" do
    visit "/"
    
    click_link "My Lounge"
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end

end