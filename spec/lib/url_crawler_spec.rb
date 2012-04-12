require File.dirname(__FILE__) + "/../../lib/url_crawler"
require 'vcr'
require 'vcr_helper' 


describe UrlCrawler do
  let(:url) { "http://doulajen.com" }
  subject { UrlCrawler.new(url) }
  
  describe "#urls" do
    it "should check if the a url is an array and it includes a url" do
      VCR.use_cassette('doulajen') do
        subject.urls.include?('http://doulajen.com/services/birth-doula/').should be_true
      end
    end 
  end

  
end