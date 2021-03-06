require 'spec_helper'

describe "WebsiteAddEdits" do
  describe "GET /websites" do
    before(:each) do
       
    end
    
    it "Create a new website" do
      website = Factory.build(:website)
      lambda do
        visit new_website_path 
        fill_in " Name", :with => website.name
        fill_in "Url", :with => website.url
        attach_file('Site map', Rails.root + "fixtures/dave.xml")
        click_button "Create Website"
      end.should change(Website, :count).by(1)
      page.should have_selector("h2", :content => website.name)
    end
    
    it "Should create a website and reformat url" do
      website = Factory.build(:website)
      lambda do
        visit new_website_path 
        fill_in " Name", :with => website.name
        fill_in "Url", :with => "dave.com"
        attach_file('Site map', Rails.root + "fixtures/dave.xml")
        click_button "Create Website"
      end.should change(Website, :count).by(1)
      page.should have_selector("p", :content => "http://dave.com")
    end
    
    describe "Creating pages from xml" do
      website = Factory.build(:website)
      it "should create pages form a given xml" do
        lambda do
         visit new_website_path 
         fill_in " Name", :with => website.name
         fill_in "Url", :with => "dave.com"
         attach_file('Site map', Rails.root + "fixtures/dave.xml")
         click_button "Create Website"
        end.should change(Page, :count).by(0)
      end
    end
  end 
 
end
