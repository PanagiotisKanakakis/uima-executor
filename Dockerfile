FROM ubuntu
RUN apt-get -yqq update && apt-get -yqq install maven

COPY script.sh .
COPY pom.xml .
COPY settings.xml /usr/share/maven/conf/

RUN mkdir workspace

RUN chmod u+x script.sh
ENTRYPOINT ["./script.sh"]
