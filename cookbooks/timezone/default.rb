execute "timezone" do
  user "root"
  command "sudo echo Asia/Tokyo > /etc/timezone"
end
