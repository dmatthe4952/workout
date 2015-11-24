require 'rails_helper'

RSpec.feature "Deleting Exercises" do
  
  
  before do
    @owner = User.create(email: "owner@example.com", password: "password")
    login_as(@owner)
    
    @owner_exer = @owner.exercises.create!(duration_in_min: 45, workout: "Cardio Activity", workout_date: 6.days.ago)
     
  end
  
  scenario "delete an exercise" do
    
    visit "/"
    
    click_link "My Lounge"
    
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Destroy']"
    
    find(:xpath, link).click
    
    expect(page).to have_content("Exercise has been deleted")
  end
end