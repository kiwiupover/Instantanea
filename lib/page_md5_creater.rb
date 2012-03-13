class PageMd5Creater
  def initialize(page)
    @page = page
  end
      
  def md5
    md5_maker(doc.to_html)
  end
  
private
  def doc
    Nokogiri::HTML(open("#{@page.url}"))
  end
  
  def md5_maker(args)
    Digest::MD5.hexdigest(args)
  end
end