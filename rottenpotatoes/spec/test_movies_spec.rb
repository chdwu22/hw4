require "rails_helper"
require 'spec_helper'

RSpec.feature "Search by director" do
  scenario "add director to existing movie" do
    visit "/"
    click_link "More about Alien"
    click_link "Edit"
    fill_in "Director", with: "Ridley Scott"
    click_button "Update Movie Info"
    expect(page).to have_content("Director: Ridley Scott")
  end
 
  scenario "Find Movies With Same Director" do
    visit "/movies/1"
    click_link "Find Movies With Same Director"
    expect(page.current_path).to eq(movies_with_same_director_path)
    expect(page).to have_content("THX-1138")
    expect(page).to have_no_content("Blade Runner")
  end 
  
  scenario "can't find similar movies if we don't know director (sad path)" do
    visit "/"
    click_link "More about Alien"
    expect(page).to have_no_content("Ridley Scott")
    click_link "Find Movies With Same Director"
    expect(page.current_path).to eq(movies_path)
  end 
  
end