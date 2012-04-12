require 'spidr'

@url = 'http://midwifeseattle.com/'


links = [] 

def urls
  crawler.every_url do |url|
     links << "#{url.scheme}://#{url.host}#{url.path}"
  end
end 
  
def crawler
  Spidr.site(@url) 
end 

p urls
p links 
