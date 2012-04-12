require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/cassettes'
  config.hook_into :webmock
end   

# VCR.configure do |c|
#   c.cassette_library_dir = 'fixtures/vcr_cassettes'
#   c.hook_into :webmock # or :fakeweb
# end 