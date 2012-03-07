class CreatePageInstance < Struct.new(:id)

  def perform
    page = Page.find(id)
    doc = Nokogiri::HTML(open("#{page.url}"))
    page_instance = PageInstance.new
    page_instance.page_id = id
    page_instance.html = doc.to_html 
    page_instance.md5 = Digest::MD5.hexdigest(page_instance.html)
    page_instance.save
  end
  
end