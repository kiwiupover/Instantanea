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
    url "http://dave.com"
    site_map {File.open(Rails.root + "fixtures/dave.xml") }
  end 
end