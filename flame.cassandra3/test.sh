#start cassandra3
#echo "dir=/home/mysql/mysql-bin" > /tmp/start_mysql.sh
#echo 'nohup $dir/bin/mysqld --basedir=$dir --datadir=$dir/data --plugin-dir=$dir/lib/plugin --log-error=$dir/data/vultr2.err --pid-file=$dir/data/vultr2.pid --socket=/tmp/mysql.sock1 --port=3306 > $dir/vultr2.err 2>&1 &' >> /tmp/start_mysql.sh
#runuser -l mysql -c 'bash /tmp/start_mysql.sh '
#su - mysql -c 'nohup "$HOME"/mysql-bin/bin/mysqld_safe --port=3306  --socket=/tmp/mysql.sock1 > start.log 2>&1 &'
#sudo -H -u mysql bash -c 'nohup "$HOME/mysql-bin/bin/mysqld_safe --port=3306  --socket=/tmp/mysql.sock1" > start.log 2>&1 &'

cd ~/mobile_tools/ycsb
#bin/ycsb load cassandra3-cql -P workloads/workloada -p hosts=127.0.0.1
echo "bin/ycsb run cassandra3-cql -P workloads/workloada -p hosts=127.0.0.1" > run.sh
nohup bash ./run.sh > run.log 2>&1 &
cd ~/mobile_tools/ycsb/flame.cassandra3
sleep 40
./start-perf.sh
./change_color.sh
./start-flame-gen.sh
#./copy_flame.sh
#stop cassandra3
#/home/mysql/mysql-bin/bin/mysqladmin shutdown --socket=/tmp/mysql.sock1 -uroot -pws206771
