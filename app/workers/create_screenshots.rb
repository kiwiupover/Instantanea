class CreateScreenshots < Struct.new(:id)
  
  def perform
    pi = PageInstance.find(id)
    page = Page.find(pi.page_id) 
    kit = IMGKit.new("#{page.url}") 
    path = "#{Rails.root}/public/#{page.title.downcase.gsub(" ","_")}.jpg"  
    file = kit.to_file(path)  
    pi.screen_shot = File.open(path)
    binding.pry 
    pi.save!
  end
  
  
end