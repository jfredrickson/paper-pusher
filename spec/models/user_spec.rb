require 'spec_helper'

describe User do
  describe "validations" do
    # Email and password validations are handled by Devise
    
    before (:each) do
      @valid_attrs = {
        :name => "Test User",
        :email => "user@example.com",
        :password => "foobar",
        :password_confirmation => "foobar"
      }
    end
  
    it "should require a name" do
      no_name = User.new(@valid_attrs.merge(:name => ""))
      no_name.should_not be_valid
    end
  end
end