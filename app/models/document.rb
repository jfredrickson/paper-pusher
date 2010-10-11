class Document < ActiveRecord::Base
  attr_accessible :name, :description, :revisions_attributes
  
  validates :name, :presence => true
  
  belongs_to :folder
  has_many :revisions
  
  default_scope order('name')
  
  accepts_nested_attributes_for :revisions, :allow_destroy => true
end
