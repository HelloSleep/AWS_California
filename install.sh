#!/bin/bash
sudo yum install -y lrzsz
sudo yum update
sudo amazon-linux-extras install -y nginx1
sudo service nginx start