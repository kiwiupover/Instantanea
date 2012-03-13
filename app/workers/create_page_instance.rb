class CreatePageInstance < Struct.new(:id)

  def perform
    
    # params = { :page_id => ..., :html => ..., :md5 => ... }  # some object returns this hash, based on Nokogiri
    # instance = PageInstance.create(params)
    
    page = Page.find(id)
    doc = Nokogiri::HTML(open("#{page.url}"))
    page_instance = PageInstance.new
    page_instance.page_id = id
    page_instance.html = doc.to_html 
    page_instance.md5 = Digest::MD5.hexdigest(page_instance.html)
    if page_instance.save
      Delayed::Job.enqueue CreateScreenshots.new(page_instance.id)
      page.touch
    end
  end
  
end