require 'spidr'
require 'pry' 

class UrlCrawler 
  def initialize(url)
    @url = url
  end
  
  def urls
    url_map = []
    Spidr.site(@url) do |spider|
      spider.every_url do |url|
        url_map << "#{url.scheme}://#{url.host}#{url.path}"
      end
    end 
    url_map  
  end 
  
private
  def crawler
    Spidr.site(@url) 
  end
end
# url_map = []
# 
# Spidr.site('https://www.fsbwa.com/') do |spider|
#   spider.every_url do |url|
#     url_map << "#{url.scheme}://#{url.host}#{url.path}"
#   end
# end   

# p url_map 

