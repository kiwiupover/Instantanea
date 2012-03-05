source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
end

gem 'jquery-rails'  

gem "omniauth-twitter" 
gem 'omniauth-facebook'

gem 'imgkit'
gem "rmagick"
gem 'carrierwave'

gem 'delayed_job_active_record'              
gem 'daemons' 
gem "delayed_job_web" 

gem 'simple_form'
gem "url_formatter"


gem 'nokogiri' 
gem 'mechanize'

group :development do
  gem 'pry-rails'
  gem 'vagrant' 
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development]
group :test do
  gem 'factory_girl_rails'
  gem "capybara"
  gem "guard-rspec"
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem 'cucumber-rails'
  gem "database_cleaner"
  gem 'guard-cucumber'
end
