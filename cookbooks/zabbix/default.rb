execute "add zabbix agent pkg" do
  user "root"

  zabbix_versio  = 2.2
  zabbix_version = node[:zabbix][:version] if node[:zabbix][:version]

  codename = 'trusty'
  codename = node[:zabbix][:codename] if node[:zabbix][:codename]
  command "wget http://repo.zabbix.com/zabbix/#{zabbix_version}/ubuntu/pool/main/z/zabbix-release/zabbix-release_#{zabbix_version}-1+#{codename}_all.deb"
  command "dpkg -i zabbix-release_2.2-1+trusty_all.deb"
  command "apt-get update"
end

package "zabbix-agent" do
  action :install
end

template "/etc/zabbix/zabbix_agentd.conf" do
  owner "root"
  group "root"
  source "./templates/etc/zabbix/zabbix_agentd.conf.erb"
end

service 'zabbix-agent' do
  action [:enable, :start]
end

service "zabbix-agent" do
  subscribes :restart, "template[/etc/zabbix/zabbix_agentd.conf]"
end
