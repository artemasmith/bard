require 'spec_helper'

describe ClientsController do

  describe "GET 'settings'" do
    it "returns http success" do
      get 'settings'
      response.should be_success
    end
  end

  describe "GET 'shops'" do
    it "returns http success" do
      get 'shops'
      response.should be_success
    end
  end

  describe "GET 'cabinet'" do
    it "returns http success" do
      get 'cabinet'
      response.should be_success
    end
  end

  describe "GET 'stats'" do
    it "returns http success" do
      get 'stats'
      response.should be_success
    end
  end

end
