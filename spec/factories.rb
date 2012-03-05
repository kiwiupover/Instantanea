Factory.define :website do |w|
 w.name "Title" 
 w.url "http://dave.com"
 w.sitemap {File.open(Rails.root + "fixtures/dave.xml") } 
end