host=`ifconfig docker0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}'`
db=ycsb
user=ycsb
pw=ws206771
rootpw=ws206771
#docker-mysql-scripts/dmysql-server $db $pw

ip=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' $db`
mysql -h $ip -uroot -p$rootpw $db << EOF
select count(1) from usertable;
EOF
