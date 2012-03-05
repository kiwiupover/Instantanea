require 'spec_helper'

describe WebsitesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
   
  # describe "Add new website" do
  #   
  #   it "should accept an xml file" do
  #     @attr = { :name => "Website Name", :url => "http://dave.com", :site_map => File.open(Rails.root + "fixtures/dave.xml")} 
  #     lambda  do
  #       post :create, :website => @attr
  #     end.should change(Website, :count).by(1) 
  #   end
  #   
  #   describe "Failure to create a website " do
  #     it "should not create a website with out the right data" do
  #      @attr = {:name => "", :url => "dave.com", :site_map => File.open(Rails.root + "fixtures/1.png")}   
  #      lambda do
  #       post :create, :website => @attr
  #      end.should_not change(Website, :count)
  #     end
  #   end
  # end 

end
