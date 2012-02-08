class Website < ActiveRecord::Base 
  has_many :pages 
  
  mount_uploader :screen_shot, ScreenShotUploader
end
