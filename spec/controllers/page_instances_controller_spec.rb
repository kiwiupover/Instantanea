require 'spec_helper'

describe PageInstancesController do

  describe "checking if the page has changed" do
    before(:each) do
      @page_instance = Factory(:page_instance)
    end
    
    it "should return the same md5 hash if the page has not been updated" do
      @page = Page.find(5)
      @page_instance = PageInstance.find_by_page_id(5) 
      doc = Nokogiri::HTML(open("#{@page.url}"))
      html = doc.to_html 
      md5 = Digest::MD5.hexdigest(html)
      md5.should == @page_instance.md5
    end 
             
    it "if it works" do
      @page = Page.find(5) 
      doc = Nokogiri::HTML(open("#{@page.url}"))
      html = doc.to_html 
      md5 = Digest::MD5.hexdigest(html)
      @pi = PageInstance.new
      @pi.update_attributes({:html => html, :md5 => md5, :page_id => 15})
      @page_instance = PageInstance.find_by_page_id(15)
      md5.should == @page_instance.md5
    end
    
  end

end   