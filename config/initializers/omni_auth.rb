Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'K3YskAOMe0oNr8dRriraZg', 'hR9G4owHKmnY8pZS6BSVGelACK6BsPGLp9LsoTwnx4'
  provider :facebook, '382059211819518', '05ba322b0952369e56ee8b1d3a17f74d', :scope => 'email,offline_access,read_stream', :display => 'popup'
end  
