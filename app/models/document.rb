class Document < ActiveRecord::Base
  attr_accessible :name, :description
  
  validates :name, :presence => true
  
  belongs_to :folder
  
  default_scope order('name')
end
