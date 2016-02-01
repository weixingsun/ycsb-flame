grep "/" palette.map > palette.map.java
grep -v "/" palette.map > palette.map.nojava
grep "^_Z" palette.map.nojava > palette.map.Z
grep -v "^_Z" palette.map.nojava > palette.map.others

sed -i 's/\(rgb(\)[0-9,]*/\1222,99,99/g' palette.map.others
sed -i 's/\(rgb(\)[0-9,]*/\199,222,99/g' palette.map.java
sed -i 's/\(rgb(\)[0-9,]*/\1222,111,55/g' palette.map.Z
sed -i '1c->rgb(252,126,126)' palette.map.others

cat palette.map.others palette.map.Z palette.map.java > palette.map.jvm
cp palette.map.jvm palette.map
rm palette.map.nojava palette.map.java palette.map.others palette.map.Z

#G -> rgb(99,222,99)  java
#R -> rgb(222,99,99)  others : kernel / unknown / interpreter
#Y -> rgb(222,222,55) c++

#perf script | stackcollapse-perf.pl | flamegraph.pl --cp --title=Spark > flame.spark.svg
