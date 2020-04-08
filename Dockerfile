FROM openjdk:8-jre-alpine
MAINTAINER kost - https://github.com/kost

ENV JYTHON_VERSION 2.7.2

RUN apk --update --no-cache add openssl ca-certificates ttf-dejavu curl
RUN mkdir -p /opt/burp /work
RUN adduser -D -s /bin/sh user user && chown -R user /work
RUN curl -L "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/${JYTHON_VERSION}/jython-installer-${JYTHON_VERSION}.jar" -o jython_installer-${JYTHON_VERSION}.jar && \
    java -jar jython_installer-${JYTHON_VERSION}.jar -s -d /jython-${JYTHON_VERSION} -i ensurepip && \
    ln -s /jython-${JYTHON_VERSION}/bin/jython /usr/bin && \
    ln -s /jython-${JYTHON_VERSION}/bin/pip /usr/bin && \
    rm jython_installer-${JYTHON_VERSION}.jar
RUN echo "Success"

ADD bin/* /opt/burp/
ADD config/ /home/user/
RUN chown -R user /home/user/.*
USER user

WORKDIR /work

ENTRYPOINT ["java", "-jar", "/opt/burp/burpsuite_pro.jar"]
