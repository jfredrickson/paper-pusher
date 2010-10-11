require 'spec_helper'

describe Revision do
  describe "validations" do
    before(:each) do
      uploaded_file = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'upload_test.txt'), 'text/plain')
      
      @valid_attrs = {
        :file => uploaded_file
      }
    end
    
    it "should require an uploaded file" do
      no_uploaded_file = Revision.new(@valid_attrs.merge(:file => nil))
      no_uploaded_file.should_not be_valid
    end
  end
end
