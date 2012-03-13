class CreatePages < Struct.new(:id)
  def perform
    website = Website.find(id)
    site_map_url = website.site_map_url

    sitemap_file = "#{Rails.root}/public#{site_map_url}"
    reader = SiteMapReader.new(sitemap_file)
    
    reader.urls.each do |url|
      Page.create(:url => url, :website_id => id)
    end
  end
end