class Folder < ActiveRecord::Base
  attr_accessible :name, :description
  
  validates :name, :presence => true
  
  belongs_to :cabinet
  
  default_scope order('name')
end
