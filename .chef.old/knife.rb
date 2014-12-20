# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "pranitpahune"
client_key               "#{current_dir}/pranitpahune.pem"
validation_client_name   "chefshort-validator"
validation_key           "#{current_dir}/chefshort-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/chefshort"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
