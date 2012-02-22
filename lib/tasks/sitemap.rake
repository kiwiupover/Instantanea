desc "Submit Url for Sitemap"
task :submit_url => :environment do
  require 'mechanize'
  agent = Mechanize.new
  agent.user_agent_alias = 'Mac Safari'
  page = agent.get "http://www.xml-sitemaps.com/"
  form = agent.page.forms.first
  form.initurl = ENV['var']
  form.submit
end