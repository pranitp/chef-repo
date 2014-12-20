#
# Cookbook Name:: hybris-poc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#execute "Hybris installer copy.." do
#	command "scp -P 2222 /root/chef/hybris-commerce-suite-5.1.0.0.zip  vagrant@127.0.0.1:/opt/binaries/"
#end

#Folder creation for Hybris binaries and other
#node.default['hybris']['dir'] = '/data/binaries/'
#node.default['hybris']['binary_executable'] = 'hybris-commerce-suite-5.1.0.0.zip
directory node['hybris']['binary'] do
  owner 'root'
  group 'root'
  action :create
end

#Coping Hybris suite binary in node
remote_file "node['hybris']['binary_executable']" do
 #path "/data/binaries/hybris-commerce-suite-5.1.0.0.zip"
 #source "http://10.207.47.156:8080/job/HybrisEcommerceSuite/2/artifact/jenkins-artifacts-workspace/binaries/hybris-commerce-suite-5.1.0.0.zip"
  source node['hybris']['binary_URL_location']
  path  "#{node['hybris']['binary']}/#{node['hybris']['binary_executable']}"
  mode "0644"
  checksum "d27ec22346341507f63cbc720af588a07eb76f842385c43a45254a1d1dff2e6b"
  action :create_if_missing
end

#Folder creation for Hybris Installation
directory node['hybris']['installation']['dir']  do
  owner 'root'
  group 'root'
  action :create
end
#Hybris binary unzip installation, 
script "Install Hybris ......." do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  unzip -o /data/binaries/hybris-commerce-suite-5.1.0.0.zip -d /data/hybris_sandbox  
  find /data/hybris_sandbox -type f -name "*.sh" | xargs chmod 775
  cd /data/hybris_sandbox/hybris/bin/platform && . ./setantenv.sh && ant clean all -Dinput.template=production -DJAVAMEM=3G
  && ./hybrisserver.sh start  
  EOH
end

