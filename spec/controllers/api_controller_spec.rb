require 'spec_helper'

describe ApiController do

  describe "GET 'ping'" do
    it "returns http success" do
      get 'ping'
      expect(response).to be_success
    end
  end

end
