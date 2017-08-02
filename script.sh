#!/bin/bash
# ./script.sh componentId groupId artifactId version className inputDir outputDir
# two volumes on docker run : v1: /opt/repository -> local repo , v2: ./workspace -> local workspace
componentId=$1
groupId=$2
artifactId=$3
version=$4
className=$5
inputDir=$6
outputDir=$7

sed -i 's/${project.groupId}/'$groupId'/' pom.xml
sed -i 's/${project.artifactId}/'$artifactId'/' pom.xml
sed -i 's/${project.version}/'$version'/' pom.xml

if find ./workspace -name "$componentId.jar" | grep -q .
then
  echo "Jar found in directory"
else
  mvn clean install
  if [ "$?" -ne 0 ];
  then
    echo "Unsuccessful build operation!"
    exit 0
  fi
  cp target/*-jar-* target/$componentId.jar
  cp target/$componentId.jar ./workspace/
fi

java -jar ./workspace/$componentId.jar $className $inputDir $outputDir
