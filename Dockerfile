# Sample from https://spring.io/guides/gs/spring-boot-docker/

FROM maven:3 AS build-env

WORKDIR /
ADD . /docker-spring-boot-sample-session-redis
RUN \
	cd docker-spring-boot-sample-session-redis && \
	mvn package -Dmaven.test.skip=true

FROM java:8-jre
VOLUME /tmp
COPY --from=build-env /docker-spring-boot-sample-session-redis/target/spring-boot-sample-session-redis-1.4.1.RELEASE.jar /app.jar
ENV JAVA_OPTS=""
ENV SERVER_PORT 8080

EXPOSE ${SERVER_PORT}

HEALTHCHECK --interval=10s --timeout=3s \
	CMD curl -v --fail http://localhost:${SERVER_PORT}/health || exit 1

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
