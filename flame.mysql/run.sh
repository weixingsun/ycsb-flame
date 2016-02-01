#cd ~/tools/
#docker pull mysql
#git clone https://github.com/luiselizondo/docker-mysql-scripts.git
#cp docker-mysql-scripts/* /usr/local/bin/

#docker ps -aq|awk '{print $1}'|xargs --no-run-if-empty docker rm
host=`ifconfig docker0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}'`
db=ycsb
user=ycsb
pw=ws206771
rootpw=ws206771
#docker-mysql-scripts/dmysql-server $db $pw

ip=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' $db`
echo "mysql -h $ip -uroot -p$pw"
mysql -h $ip -uroot -p$rootpw  << EOF
create database if not exists ycsb;
grant all on $db.* to '$user'@'$host' identified by '$pw';
FLUSH PRIVILEGES;
use ycsb;
CREATE TABLE if not exists usertable (
    YCSB_KEY VARCHAR(255) PRIMARY KEY,
    FIELD0 TEXT, FIELD1 TEXT,
    FIELD2 TEXT, FIELD3 TEXT,
    FIELD4 TEXT, FIELD5 TEXT,
    FIELD6 TEXT, FIELD7 TEXT,
    FIELD8 TEXT, FIELD9 TEXT
);
EOF
echo "ycsb setup finished"
#cd ~/tools/
#git clone https://github.com/brianfrankcooper/YCSB.git
#cd YCSB

#-threads 4
#bin/ycsb load jdbc -P workloads/workloada -cp jars/mysql-connector-java-5.1.38-bin.jar \
#-p jdbc.driver=com.mysql.jdbc.Driver -p db.url=jdbc:mysql://$ip:3306/$db -p db.user=$user -p db.passwd=$pw \
#-p jdbc.fetchsize=10 -p jdbc.autocommit=true

../bin/ycsb run jdbc -P ../workloads/workloada -cp ../jars/mysql-connector-java-5.1.38-bin.jar \
-p jdbc.driver=com.mysql.jdbc.Driver -p db.url=jdbc:mysql://$ip:3306/$db -p db.user=$user -p db.passwd=$pw \
-p jdbc.fetchsize=2 -p jdbc.autocommit=true
