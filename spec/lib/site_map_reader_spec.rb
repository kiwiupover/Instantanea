require File.dirname(__FILE__) + "/../../lib/site_map_reader"

describe SiteMapReader do
  let(:sitemap_file) { File.dirname(__FILE__) + "/../../fixtures/sitemap_test.xml" }
  subject { SiteMapReader.new(sitemap_file) }

  describe "#urls" do    
    it "should return all the URLs in the sitemap" do
      subject.urls.should == [
        "http://kiwiupover.com/mission-adventures-2010/",
        "http://kiwiupover.com/mission-adventures-2007/"
      ]    
    end
  end
end