#!/usr/bin/env bash

echo "::::::::::::::::::::::::::::::::::::::::::::"
echo "::: Installing JRuby [1.7.0] via tar ball..."
echo "::::::::::::::::::::::::::::::::::::::::::::"
wget https://s3.amazonaws.com/kcsdb-init/jruby-bin-1.7.0.tar.gz --output-document /home/ubuntu/jruby-bin-1.7.0.tar.gz --quiet
tar xf /home/ubuntu/jruby-bin-1.7.0.tar.gz
echo "JRUBY_HOME=/home/ubuntu/jruby-1.7.0" >> $HOME/.bashrc
echo "PATH=$PATH:$JRUBY_HOME/bin" >> $HOME/.bashrc
. $HOME/.bashrc
rvmsudo jruby -S gem install jmx4r -v '0.1.4'