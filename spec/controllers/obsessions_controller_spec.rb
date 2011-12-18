require 'spec_helper'

describe ObsessionsController do

  describe "GET 'stalk'" do
    it "should be successful" do
      get 'stalk'
      response.should be_success
    end
  end

  describe "GET 'unstalk'" do
    it "should be successful" do
      get 'unstalk'
      response.should be_success
    end
  end

end
