#
# Cookbook Name:: rails-demo
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
application "rails-demo" do
	path "/var/www/rails-apps/rails-demo"
	owner "vagrant"
	group "vagrant"
	#Where to get this application
	#repository "https://github.com/pranitp/chef-repo.git"
	#repository "https://github.com/trotter/rails-hello-world.git"
	#Sub resource
	passenger_apache2	

end
