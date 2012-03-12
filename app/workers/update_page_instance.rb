class UpdatePageInstance < Struct.new(:id)
  
  def perform
    @website = Website.find(id) 
    @pages = Page.where(:website_id => @website.id)

    @pages.each do |page|
      doc = Nokogiri::HTML(open("#{page.url}"))
      html = doc.to_html 
      md5 = Digest::MD5.hexdigest(html)
      page_instance = PageInstance.where(:page_id => page.id).last 
      binding.pry
      if md5 != page_instance.md5
        Delayed::Job.enqueue CreatePageInstance.new(page.id)
        touch @website
      end
    end
  end

end   