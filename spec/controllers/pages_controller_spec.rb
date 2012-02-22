require 'spec_helper'

describe PagesController do
  render_views
  
  describe "Creating Pages" do
    it "should create a page " do
      Page.create!({:title => "Title", :url => "http://dave.com"}).should change(Page, :count).by(1)  
    end
  end
end