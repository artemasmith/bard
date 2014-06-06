require 'spec_helper'

describe UsersController do

  describe "GET 'settings'" do
    it "returns http success" do
      get 'settings'
      response.should be_success
    end
  end

  describe "GET 'cabinet'" do
    it "returns http success" do
      get 'cabinet'
      response.should be_success
    end
  end

end
