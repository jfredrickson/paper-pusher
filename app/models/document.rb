class Document < ActiveRecord::Base
  attr_accessible :name, :description, :revisions_attributes
  
  validates :name, :presence => true
  
  belongs_to :folder
  has_many :revisions
  
  default_scope order('name')
  
  accepts_nested_attributes_for :revisions, :allow_destroy => true
  
  CONTENT_TYPES = {
    "application/pdf" => "PDF",
    "application/msword" => "Microsoft Word",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" => "Microsoft Word",
    "application/vnd.ms-excel" => "Microsoft Excel",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" => "Microsoft Excel",
    "application/vnd.ms-powerpoint" => "Microsoft Powerpoint",
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" => "Microsoft Powerpoint",
    "text/plain" => "plain text",
    "text/html" => "HTML",
    "image/png" => "PNG image",
    "image/jpeg" => "JPEG image",
    "image/gif" => "GIF image",
    "video/quicktime" => "QuickTime movie",
    "application/zip" => "zip archive"
  }
end
