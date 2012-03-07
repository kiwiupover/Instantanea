class Website < ActiveRecord::Base 
  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true
  validates :site_map, :presence => true 
  
  format_url :url
  
  has_many :pages   
  
  mount_uploader :site_map, SitemapUploader  
  
end
