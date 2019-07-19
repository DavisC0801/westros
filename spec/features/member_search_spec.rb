require "rails_helper"

describe "As a user when  I visit /" do
  it "has a dropdown to select a house" do
    visit root_path
    expect(page).to have_button("Get Members")
  end
# And I click on "Get Members"
# Then my path should be "/search" with "house=greyjoy" in the parameters
# And I should see a message "7 Members"
# And I should see a list of the 7 members of House Greyjoy
# And I should see a name and id for each member.
end
