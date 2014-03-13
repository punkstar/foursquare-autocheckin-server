require 'spec_helper'

describe FoursquareController do

  context "when not logged in" do
    describe "GET 'connect'" do
      it "returns http unauthorized" do
        get 'connect'

        expect(response.status).to eq(302)
      end
    end

    describe "GET 'callback'" do
      it "returns http unauthorized" do
        get 'callback'

        expect(response.status).to eq(302)
      end
    end
  end

  context "when logged in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET 'connect'" do
      it "returns redirects to foursquare" do
        get 'connect'

        expect(response.status).to eq(302)
      end
    end

    describe "GET 'callback'" do
      it "returns http success" do
        skip "TODO: correctly mock foursquare service"
      end
    end
  end
end
