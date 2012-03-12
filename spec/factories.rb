# FactoryGirl.define do
#   factory :user do
#     sequence(:email){|n| "email#{n}@factory.com" }
#     password "foobar"
#     password_confirmation "foobar"
#   end
# end

FactoryGirl.define do 
  factory :website do
    sequence(:name){ |n| "Title-Name-#{n}"} 
    url "http://kiwiupover.com"
    site_map {File.open(Rails.root + "fixtures/kiwiupover.com.xml") }
  end
  
  factory :page do
     sequence(:title){ |n| "KIWIUPOVERAbout-#{n}"} 
     url "http://kiwiupover.com/about-dave-laird/"
  end 
  
  factory :page_instance do 
    html File.read(Rails.root + "fixtures/page_instance_html.html").to_s
    # html '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US"><head profile="http://gmpg.org/xfn/11">'
    md5 "8b3290495a337a851bb178d9d634dec6"
  end 

end