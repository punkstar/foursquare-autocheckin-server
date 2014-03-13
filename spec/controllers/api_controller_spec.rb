require 'spec_helper'

describe ApiController do

  describe "GET 'ping'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.devices << FactoryGirl.create(:device, :mac_address => 'aa:bb:cc:dd:ee:ff')
      @user.devices << FactoryGirl.create(:device, :mac_address => 'gg:hh:ii:jj:kk:ll')

      allow_any_instance_of(Foursquare2::Client).to receive(:add_checkin)
      allow_any_instance_of(Foursquare2::Client).to receive(:venue).and_return(Hashie::Mash.new({
        :location => {
          :lat => 10,
          :lng => 10
        }
      }))
    end

    it "doesn't checkin when no devices match" do
      expect_any_instance_of(User).to receive(:checkin).exactly(0).times
      get 'ping', :mac_addresses => "11:22:33:44:55:66,77:88:99:10:11:12", :format => :json
    end

    it "checks in when a device matches" do
      expect_any_instance_of(User).to receive(:checkin).at_least(1).times
      get 'ping', :mac_addresses => "aa:bb:cc:dd:ee:ff", :format => :json
    end

    it "checks only once when multiple devices match" do
      expect_any_instance_of(User).to receive(:checkin).exactly(:once)
      get 'ping', :mac_addresses => "aa:bb:cc:dd:ee:ff,gg:hh:ii:jj:kk:ll", :format => :json
    end
  end
end
