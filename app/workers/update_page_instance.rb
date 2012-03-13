class UpdatePageInstance < Struct.new(:id)
  
  def perform
    website = Website.find(id) 
    pages = Page.where(:website_id => website.id)

    pages.each do |page|
      creater = PageMd5Creater.new(page)
      page_instance = PageInstance.latest(page.id).last
      if creater.md5 != page_instance.md5
        Delayed::Job.enqueue CreatePageInstance.new(page.id)
        website.touch
      end
    end
  end

end   