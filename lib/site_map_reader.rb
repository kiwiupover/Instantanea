class SiteMapReader
  def initialize(filename)
    @filename = filename
  end
  
  def urls
    sitemap.css("url loc").map do |url|  
      url.text
    end
  end

private
  def sitemap
    Nokogiri::XML(File.read(@filename))
  end
end