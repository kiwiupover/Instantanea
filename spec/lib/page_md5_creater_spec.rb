require File.dirname(__FILE__) + "/../../lib/page_md5_creater" 

describe PageMd5Creater do
  let(:page) { double(:page,
                      :id => 4,
                      :url => 'http://kiwiupover.com',
                      :md5 => "86e5be7bde87eb98286c6dbaab6dde0c") } 
  subject {PageMd5Creater.new(page)}
  
  it "#md5 hash creater should return hash" do
    subject.md5.should == "86e5be7bde87eb98286c6dbaab6dde0c"
  end 
  
  describe "page change" do
    let(:page) {double(:page,
                        :url => 'http://kiwiupover.com/about-dave-laird')}
    subject {PageMd5Creater.new(page)}
    
    it "should return the a different hash" do
      subject.md5.should_not == "86e5be7bde87eb98286c6dbaab6dde0c"
    end
    
  end

end