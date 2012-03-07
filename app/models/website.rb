class Website < ActiveRecord::Base 
  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true
  validates :site_map, :presence => true 
  
  format_url :url
  
  has_many :pages   
  # after_create :create_pages_from_xml 
  
  mount_uploader :site_map, SitemapUploader 
  
  def create_pages_from_xml
    site_map_name = read_attribute :site_map
    # sitemap = File.basename(site_map.url) 
    # site_map = File.open(Rails.root.join("/uploads/website/site_map/#{id}/#{site_map_name}")) 
    f = "#{Rails.root}/uploads/website/site_map/#{id}/#{site_map_name}"
    site_map = File.open(f)
    @sitemap = Nokogiri::XML(site_map)
    url = @sitemap.css("url loc")
    url.each do |page|
      page = page.text
      Page.create(:url => page, :website_id => id) 
    end
  end 
  handle_asynchronously :create_pages_from_xml 
  
  def download
    require 'open-uri'
    writeOut = open(Rails.root.join('fixtures/doulajen.xml'), "wb")
    writeOut.write(open('http://cdn.snapsitemap.com/sitemap/52550.xml').read)
    writeOut.close  
  end 
  
end
