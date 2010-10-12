require 'spec_helper'

describe Revision do
  describe "validations" do
    before(:each) do
      uploaded_file = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'upload_test.txt'), 'text/plain')
      @document = Factory(:document)
      
      @valid_attrs = {
        :file => uploaded_file
      }
    end
    
    it "should require an uploaded file" do
      no_uploaded_file = @document.revisions.build(@valid_attrs.merge(:file => nil))
      no_uploaded_file.should_not be_valid
    end
    
    it "should require content types to match the original revision's content type" do
      orig_revision = @document.revisions.create(@valid_attrs)
      
      image_file = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'upload_test.png'), 'image/png')
      
      wrong_type_revision = @document.revisions.build(@valid_attrs.merge(:file => image_file))
      wrong_type_revision.should_not be_valid
    end
  end
end
