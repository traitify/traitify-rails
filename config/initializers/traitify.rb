require 'traitify'

# Configure the traitify gem. These are the only required fields
# Set your environment variables for the api_host and your secret.
# Your secert key can be found in the the developer portal:
#
# http://developer.traitify.com
Traitify.configure do |t|
  t.api_host = ENV['TRAITIFY_API_HOST']
  t.api_version = "v1"
  t.secret = ENV['TRAITIFY_API_KEY']
end
