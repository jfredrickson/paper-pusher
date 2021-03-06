class Cabinet < ActiveRecord::Base
  attr_accessible :name, :description
  
  validates :name, :presence => true
  
  has_many :folders
  
  default_scope order('name')
end
