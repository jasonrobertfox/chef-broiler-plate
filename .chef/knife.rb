current_dir = File.dirname(__FILE__)
node_name               ENV['OPSCODE_USER']
client_key              "#{ENV['KNIFE_CLIENT_KEY_FOLDER']}/#{ENV['OPSCODE_USER']}.pem"
validation_client_name  "#{ENV['OPSCODE_ORGNAME']}-validator"
validation_key          "#{ENV['KNIFE_VALIDATION_KEY_FOLDER']}/#{ENV['OPSCODE_ORGNAME']}-validator.pem"
chef_server_url         ENV['KNIFE_CHEF_SERVER']

#Caching
cache_type              'BasicFile'
cache_options( :path => ENV['KNIFE_CACHE_PATH'] )

#Logging
log_level               :info
log_location            STDOUT

#Cookbooks
cookbook_path           ["#{current_dir}/../cookbooks"]
cookbook_copyright      ENV['KNIFE_COOKBOOK_COPYRIGHT']
cookbook_license        ENV['KNIFE_COOKBOOK_LICENSE']
cookbook_email          ENV['KNIFE_CACHE_PATH']
