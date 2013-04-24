#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2013, Never Stop Building
#
# All rights reserved - Do Not Redistribute
#
data_bag_item = data_bag_item('global-properties', 'company')

template '/etc/motd.tail' do
  source 'motd.tail.erb'
  mode '0644'

  company_name = data_bag_item['name']
  filler = '#' * company_name.length
  space_filler = ' ' * company_name.length

  variables(
    :company_name => company_name,
    :filler => filler,
    :space_filler => space_filler
  )
  action :create
end
