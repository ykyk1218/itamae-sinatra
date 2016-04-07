package "tmpreaper" do
  action :install
end

template "/etc/tmpreaper.conf" do
  owner "root"
  group "root"
  mode "644"
  source "./templates/etc/tmpreaper.conf.erb"
end
