FROM openjdk:8-jre-alpine
MAINTAINER kost - https://github.com/kost

ENV JYTHON_VERSION 2.7.2

RUN apk --update --no-cache add openssl ca-certificates ttf-dejavu curl bash
RUN mkdir -p /opt/burp /work
RUN adduser -D -s /bin/sh user user && chown -R user /work
RUN curl -L "https://repo1.maven.org/maven2/org/python/jython-standalone/${JYTHON_VERSION}/jython-standalone-${JYTHON_VERSION}.jar" -o /usr/bin/jython.jar
RUN echo "Success"

ADD bin/* /opt/burp/
ADD config/ /home/user/
RUN chown -R user /home/user/.*
USER user

WORKDIR /work

ENTRYPOINT ["java", "-jar", "/opt/burp/burpsuite_pro.jar"]
