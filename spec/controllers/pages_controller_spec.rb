require 'spec_helper'

describe PagesController do
  render_views
  
  describe "Post Create" do
    
    before(:each) do
      @attr = { :title => "Title", :url => "http://dave.com"}
    end
    
    it "should not creat a page" do
      lambda  do
        post :create, :page => @attr
      end.should change(Page, :count).by(1)
    end
  end
end