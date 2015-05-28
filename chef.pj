https://docs.chef.io/install_server.html
https://docs.chef.io/ctl_chef_server.html


# To set up private chef on an m1.small EC2 instance running Ubuntu 14.04:

sudo sh -c 'echo foo.example.com > /etc/hostname'    # very important on ec2 instances!
sudo shutdown -r now
wget https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.8-1_amd64.deb
sudo dpkg -i chef-server*
sudo chef-server-ctl reconfigure
sudo chef-server-ctl user-create pjungwir Paul Jungwirth pj@illuminatedcomputing.com changeme
sudo chef-server-ctl password pjungwir
sudo chef-server-ctl org-create short_numm full_name --assocation_user pjungwir


# To install the management webapp:

sudo chef-server-ctl install opscode-manage
sudo chef-server-ctl reconfigure
sudo opscode-manage-ctl reconfigure


# To create encrypted data bags:

openssl rand -base64 512 >.chef/encrypted_data_bag_secret



# To upload cookbooks:

knife cookbook upload this that the other



# To load roles:

knife role from file roles/web.json



# To manage EC2 servers:

knife ec2 server list

ssh-add ~/.ssh/pjungwir-aws.pem
knife ec2 server create -I ami-d05e75b8 -f m3.medium -Z us-east-1b -E staging -r 'roles[web]' --server-connect-attribute private_ip_address --ssh-user ubuntu --ssh-gateway ec2-user@bastion-staging.example.com --identity-file=~/src/example/doc/aws/pjungwir.pem -s subnet-7162eb5a -g sg-239eae47 -N staging-web-1 --iam-profile staging-web



# To run things again:

knife ssh 'role:web' 'sudo chef-client'
knife ssh 'node:foo' 'sudo chef-client'

