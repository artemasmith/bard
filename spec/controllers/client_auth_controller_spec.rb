require 'spec_helper'

describe ClientAuthController do

  describe "GET 'get_token'" do
    it "returns http success" do
      get 'get_token'
      response.should be_success
    end
  end

  describe "GET 'update_token'" do
    it "returns http success" do
      get 'update_token'
      response.should be_success
    end
  end

end
