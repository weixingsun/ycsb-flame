#perf script | stackcollapse-perf.pl | flamegraph.pl --cp --colors java --title=Spark > flame.spark.svg
#perf script | stackcollapse-perf.pl | flamegraph.pl --cp --title=MySQL > flame.mysql.svg
perf script | stackcollapse-perf.pl | flamegraph.pl --cp --title=Cassandra-3.2.1 > flame.cassandra.svg
