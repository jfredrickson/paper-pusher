require 'spec_helper'

describe Document do
  describe "validations" do
    before(:each) do
      @valid_attrs = {
        :name => "Plan #1",
        :description => "Virtucon's secret plan for world domination, phase 1"
      }
    end
    
    it "should require a name" do
      no_name = Document.new(@valid_attrs.merge(:name => ""))
      no_name.should_not be_valid
    end
  end
end
