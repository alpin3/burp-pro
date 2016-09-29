FROM openjdk:8-jre-alpine
MAINTAINER kost - https://github.com/kost

RUN apk --update add openssl ca-certificates ttf-dejavu && rm -f /var/cache/apk/* && \
 mkdir -p /opt/burp /work && adduser -D -s /bin/sh user user && chown -R user /work && \
 echo "Success"

ADD bin/* /opt/burp/
ADD config/ /home/user/
RUN chown -R user /home/user/.*
USER user

WORKDIR /work

ENTRYPOINT ["java", "-jar", "/opt/burp/burpsuite_pro.jar"]
