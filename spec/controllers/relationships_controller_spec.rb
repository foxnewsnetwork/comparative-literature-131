require 'spec_helper'

describe RelationshipsController do

  describe "GET 'follow'" do
    it "should be successful" do
      get 'follow'
      response.should be_success
    end
  end

  describe "GET 'unfollow'" do
    it "should be successful" do
      get 'unfollow'
      response.should be_success
    end
  end

end
