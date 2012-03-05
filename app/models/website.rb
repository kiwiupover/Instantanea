class Website < ActiveRecord::Base 
  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true
  validates :site_map, :presence => true 
  
  format_url :url
  
  # has_many :pages   
  # before_create :create_pages_from_xml 
  
  mount_uploader :site_map, SitemapUploader 
  
  def create_pages_from_xml
    sitemap = File.open(Rails.root.join('fixtures/dave.xml'))
    @sitemap = Nokogiri::XML(sitemap)
    url = @sitemap.css("url loc")
    url.each do |page|
      page = page.text
      Page.create(:url => page)
    end
  end 
  
  
  def download
    require 'open-uri'
    writeOut = open(Rails.root.join('fixtures/doulajen.xml'), "wb")
    writeOut.write(open('http://cdn.snapsitemap.com/sitemap/52550.xml').read)
    writeOut.close  
  end 
  
end
