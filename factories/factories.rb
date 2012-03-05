Factory.define :website do |w|
 w.title "Title" 
 w.url "http://dave.com"
 w.sitemap {File.open(Rails.root + "fixtures/dave.xml") } 
end                
