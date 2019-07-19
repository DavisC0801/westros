require "rails_helper"

describe Member do
  before :each do
    @member = Member.new({id: 1, name: "Ned Stark"})
    @member2 = Member.new({id: 9001, name: "That Other One"})
  end

  it "has attributes" do
    expect(@member.id).to eq(1)
    expect(@member2.id).to eq(9001)
    expect(@member.name).to eq("Ned Stark")
    expect(@member2.name).to eq("That Other One")
  end
end
