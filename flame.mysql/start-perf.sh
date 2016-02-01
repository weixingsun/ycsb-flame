#sudo -H -u mobile bash /home/mobile/start_spark.sh
perf record -F 99 -g -p `pgrep -x mysqld` -- sleep 30
#perf record -F 99 -ag -- sleep 30
