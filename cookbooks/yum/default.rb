execute "yum update" do
  command "sudo yum update" 
end

%w(curl-devel libffi-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker libxslt-devel libxml2-devel sqlite-devel gcc gcc-c++ readline-devel).each do |pkg|
  package pkg
end

execute "devtools" do
  user 'root'
  command 'yum -y groupinstall "Development Tools"'
end
