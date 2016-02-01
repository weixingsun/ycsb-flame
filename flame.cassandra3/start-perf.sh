#sudo -H -u mobile bash /home/mobile/start_spark.sh
perf record -F 99 -g -p `ps -ef|grep CassandraDaemon|grep -v grep|awk '{print $2}'` -- sleep 30
jmaps
#perf record -F 99 -ag -- sleep 30
