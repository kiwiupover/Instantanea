require 'spec_helper'

describe "WebsiteAddEdits" do
  describe "GET /websites" do
    it "Create a new website" do
      website = Factory(:website)
      lambda do
        get new_website_path
        fill_in "Name", :with => website.name
        fill_in "Url", :with => website.url
        attach_file('Site Map', website.site_map)
        click_button "Submit"
      end.should change(Website, :count).by(1)
    end 
  end
end
