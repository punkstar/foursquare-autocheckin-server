require "spec_helper"

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "cleans up dangling device references" do
    user = FactoryGirl.create(:user)

    user.devices << FactoryGirl.create(:device)
    user.devices << FactoryGirl.create(:device)
    user.devices << FactoryGirl.create(:device)

    user_id = user.id

    expect(Device.where(:user_id => user_id).count).to eq(3)

    user.destroy!

    expect(Device.where(:user_id => user_id).count).to eq(0)
  end
end
