require "rails_helper"

describe HouseSearchService do
  before :each do
    @test_service = HouseSearchService.new("Stark")
  end

  it "#total_members" do
    VCR.use_cassette("/houses/stark", allow_playback_repeats: true) do
      expect(@test_service.search.count).to eq(11)
    end
  end

  it "#member_list" do
    VCR.use_cassette("/houses/stark", allow_playback_repeats: true) do
      expect(@test_service.search.first[:id]).to eq(1)
      expect(@test_service.search.last[:id]).to eq(11)
      expect(@test_service.search.first[:name]).to eq("Rickard Stark")
      expect(@test_service.search.last[:name]).to eq("Benjen Stark")
    end
  end
end
