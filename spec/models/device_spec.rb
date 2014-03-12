require "spec_helper"

describe Device do
  it "has a valid factory" do
    expect(FactoryGirl.create(:device)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:device, name: nil)).not_to be_valid
  end

  it "is invalid without a mac address" do
    expect(FactoryGirl.build(:device, mac_address: nil)).not_to be_valid
  end
end
