class CreatePages < Struct.new(:id, :site_map)
  
  def perform
    website = Website.find(id) 
    site_map_url = website.site_map.url 
    site_map = File.open("#{Rails.root}/public#{site_map_url}")
    @sitemap = Nokogiri::XML(site_map)
    url = @sitemap.css("url loc")
    url.each do |page|
      page = page.text
      Page.create(:url => page, :website_id => id) 
    end
  end

end  
# class NewsletterJob < Struct.new(:text, :emails)
#   def perform
#     emails.each { |e| NewsletterMailer.deliver_text_to_email(text, e) }
#   end
# end
# 
# Delayed::Job.enqueue NewsletterJob.new('lorem ipsum...', Customers.find(:all).collect(&:email))          