require "rails_helper"

describe "As a user when  I visit /" do
  it "has a dropdown to select a house" do
    visit root_path
    expect(page).to have_content("Stark")
    expect(page).to have_content("Lannister")
    expect(page).to have_content("Targaryen")
    expect(page).to have_content("Tyrell")
    expect(page).to have_content("Greyjoy")
    expect(page).to have_button("Get Members")
  end

  it "searches for house members" do
    VCR.use_cassette("houses/greyjoy") do
      visit root_path
      select("Greyjoy")
      click_button("Get Members")
      expect(current_path).to eq(search_path)
      expect(page).to have_content("7 Members")
      expect(page).to have_content("ID: 38")
      expect(page).to have_content("Balon Greyjoy")
      expect(page).to have_content("ID: 44")
      expect(page).to have_content("Euron Greyjoy")
    end
  end
end
