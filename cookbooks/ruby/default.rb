execute "add rbenv path" do
  command <<-"EOH"
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/#{node[:server][:user]}/.bashrc
    echo 'eval "$(rbenv init -)"' >> /home/#{node[:server][:user]}/.bashrc
  EOH
  not_if "grep -q rbenv /home/#{node[:server][:user]}/.bashrc"
end