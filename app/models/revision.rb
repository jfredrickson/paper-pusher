class Revision < ActiveRecord::Base
  attr_accessible :note, :file
  
  validates :data, :presence => true
  
  belongs_to :document
  
  def file=(incoming_file)
    self.content_type = incoming_file.content_type
    self.data = incoming_file.read
  end
end
