require 'spec_helper'

describe DevicesController do
  context "when not logged in" do
    describe "GET 'devices#index'" do
      it "should redirect user to login" do
        get "index"
        expect(response.status).to eq(302)
      end
    end

    describe "POST 'devices#create'" do
      it "should redirect user to login" do
        post "create"
        expect(response.status).to eq(302)
      end
    end

    describe "GET 'devices#new'" do
      it "should redirect user to login" do
        get "new"
        expect(response.status).to eq(302)
      end
    end

    describe "GET 'devices#edit'" do
      it "should redirect user to login" do
        @device = FactoryGirl.create(:device)

        get "edit", :id => @device.id
        expect(response.status).to eq(302)
      end
    end

    describe "GET 'devices#show'" do
      it "should redirect user to login" do
        @device = FactoryGirl.create(:device)

        get "show", :id => @device.id
        expect(response.status).to eq(302)
      end
    end

    describe "PUT 'devices#update'" do
      it "should redirect user to login" do
        @device = FactoryGirl.create(:device)

        put "update", :id => @device.id
        expect(response.status).to eq(302)
      end
    end

    describe "DELETE 'devices#delete'" do
      it "should redirect user to login" do
        @device = FactoryGirl.create(:device)

        delete "destroy", :id => @device.id
        expect(response.status).to eq(302)
      end
    end
  end
end
