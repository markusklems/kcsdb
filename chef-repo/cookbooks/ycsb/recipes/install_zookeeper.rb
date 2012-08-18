# ====================================== #
# @author: lha | me(at)lehoanganh(dot)de #
# ====================================== #

# the recipe is used to install ZooKeeper on each Cassandra's node
# ZooKeeper is responsible to coordinate many YCSB clients within a cluster
# to generate a workload together on a SUT

# step 1: download the tar ball
execute "wget https://s3.amazonaws.com/kcsdb-lehoanganh/zookeeper-3.3.6.tar.gz -O $HOME/zk.tar.gz"

# step 2: create an empty folder for ZooKeeper
execute "mkdir -p #{node[:ycsb][:zookeeper_home]}"

# step 3: extract the ZooKeeper tar ball into the folder
execute "tar -xf $HOME/zk.tar.gz --strip-components=1 -C #{node[:ycsb][:zookeeper_home]}"

# step 4: move zoo.cfg into ZooKeeper folder
execute "mv $HOME/zoo.cfg #{node[:ycsb][:zookeeper_home]}/conf"

# step 5: move myid into ZooKeeper folder
execute "mv $HOME/myid #{node[:ycsb][:zookeeper_home]}"

# step 6: start ZooKeeper
execute "sudo #{node[:ycsb][:zookeeper_home]}/bin/./zkServer.sh start"