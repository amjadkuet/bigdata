cd /home/vagrant
rm -rf input
mkdir input
cp intersect/data/* input
rm -rf output
export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$JAVA_HOME/bin:$PATH
export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar
rm -rf code
mkdir code
cp intersect/code/*.java code
echo "Hadoop initial processing"
hadoop/bin/hadoop com.sun.tools.javac.Main code/Intersection.java
echo "Java jar processing"
cd code
jar cf insect.jar Intersection*.class
cd ..
echo "Hadoop execution"
hadoop/bin/hadoop jar code/insect.jar Intersection input output