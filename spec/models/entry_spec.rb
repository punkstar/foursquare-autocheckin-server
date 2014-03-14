require 'spec_helper'

describe Entry do
  it "has a valid factory" do
    expect(FactoryGirl.create(:entry)).to be_valid
  end

  it "is invalid without an device" do
    expect(FactoryGirl.build(:entry, device_id: nil)).not_to be_valid
  end
end
