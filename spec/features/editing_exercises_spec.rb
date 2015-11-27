require 'rails_helper'

RSpec.feature "Editing Exercises" do
  
  before do
    @owner = User.create(email: "owner@example.com", password: "password", first_name: "John", last_name: "Doe")
    login_as(@owner)
    
    @owner_exer = @owner.exercises.create!(duration_in_min: 45, workout: "Cardio Activity", workout_date: 6.days.ago)
     
  end

  scenario "with valid inputs" do
    visit "/"
    
    click_link "My Lounge"
    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
    find(link).click
    
    fill_in "Duration", with: 55
    
    click_button "Update Exercise"
    
  end
  
  
end