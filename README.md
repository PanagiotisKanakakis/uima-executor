# uima-executor

### Docker build/run command

```properties 

docker build -t <name> . 

docker run -v localMvnRepo:/opt/repository -v localComponentDir:/workspace <name> componentId groupId artifactId version execClassName inputDir outputDir 

```
