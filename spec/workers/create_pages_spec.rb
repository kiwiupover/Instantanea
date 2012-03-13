require 'spec_helper'

describe CreatePages do
  describe "#perform" do
    let(:website_id) { 12 }
    let(:website) { double(:website,
                           :site_map_url => '/files/myfile.xml') }
    let(:urls) {
      ["http://www.google.com", "http://www.test.com"]
    }
    
    let(:reader) { double(:reader,
                          :urls => urls) } 

    subject { CreatePages.new(website_id) }
    
    before do
      Website.stub(:find => website)
      SiteMapReader.stub(:new => reader)
      Page.stub!(:create)
    end
    
    it "should find the correct Website" do
      Website.should_receive(:find).
        with(website_id).
        and_return(website)
      subject.perform 
    end
    
    it "should instantiate a reader correctly" do
      SiteMapReader.should_receive(:new).
        with("#{Rails.root}/public/files/myfile.xml").
        and_return(reader)
      subject.perform
    end    
    
    it "should create two pages from two urls" do
      Page.should_receive(:create).twice
      subject.perform
    end
    
    it "should create the Page correctly" do
      reader.stub(:urls => ["http://www.google.com"])
      Page.should_receive(:create).
        with(:url => "http://www.google.com", :website_id => website_id)
      subject.perform
    end
  end
end