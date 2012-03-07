class PageInstance < ActiveRecord::Base
  belongs_to :page
  
  # after_create :add_html 
  
  mount_uploader :screen_shot, ScreenShotUploader
  
  def page_thumbnails 
    kit = IMGKit.new("#{self.url}") 
    path = "#{Rails.root}/public/tmp/#{self.title.downcase.gsub(" ","_")}.jpg"  
    file = kit.to_file(path)  
    self.screen_shot = File.open(path) 
    self.save!   
  end
end
