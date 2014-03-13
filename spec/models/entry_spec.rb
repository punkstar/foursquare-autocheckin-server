require 'spec_helper'

describe Entry do
  it "has a valid factory" do
    expect(FactoryGirl.create(:entry)).to be_valid
  end
end
