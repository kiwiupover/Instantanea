require 'spec_helper'  

describe UpdatePageInstance do
  describe "#preform" do
    let(:website_id) { 1 }
    let(:website) { double( :website,
                            :id => 1) }
    
    let(:page) { double( :page,
                          :id => 5,
                          :url => "http://kiwiupover.com",
                          :md5 => "86e5be7bde87eb98286c6dbaab6dde0c")}
    
    let(:md5) { double(:md5,
                            :md5_maker => "86e5be7bde87eb98286c6dbaab6dde0c")}
                            
    before do
      Website.stub(:find => website)
      PageMd5Creater.stub(:new => page)
      Page.stub(:find => page) 
    end
    
    subject { UpdatePageInstance.new(website_id) }
    
    it "should find the correct Website" do
      Website.should_receive(:find).
        with(website_id).
        and_return(website)
      subject.perform 
    end
    
    it "should return a md5 hash" do
      PageMd5Creater.should_receive(:new).
        with(page).
        and_return(md5)
      subject.perform
    end 
    
  end

end