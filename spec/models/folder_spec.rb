require 'spec_helper'

describe Folder do
  describe "validations" do
    before(:each) do
      @valid_attrs = {
        :name => "Top Secret",
        :description => "Virtucon's secret plans"
      }
    end
    
    it "should require a name" do
      no_name = Folder.new(@valid_attrs.merge(:name => ""))
      no_name.should_not be_valid
    end
  end
end