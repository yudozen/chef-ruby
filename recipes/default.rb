#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/home/vagrant/tmp/ruby-1.9.3-p362.tar.gz" do
	source "http://core.ring.gr.jp/archives/lang/ruby/1.9/ruby-1.9.3-p362.tar.gz"
	checksum "eb593607862b16a28176ae6d086dbe3bd9bd41935ec999a8cd5ef8773e8239d6"
	notifies :run, "bash[install_ruby]", :immediately
end

bash "install_ruby" do
	user "root"
	cwd "/home/vagrant/tmp"
	code <<-EOH
		tar -zxf ruby-1.9.3-p362.tar.gz
		(cd ruby-1.9.3-p362 && ./configure && make && make install)
	EOH
	action :nothing
end
