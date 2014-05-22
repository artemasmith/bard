require 'spec_helper'

describe Api::V1::ClientAuthController do

  describe "GET 'get_token'" do
    it "returns http success" do
      pending
      post create_session_path
      response.should be_success
    end
  end

  describe "GET 'update_token'" do
    it "returns http success" do
      pending
      put update_session_path
      response.should be_success
    end
  end

end
