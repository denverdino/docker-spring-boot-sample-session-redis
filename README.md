# docker-spring-boot-sample-session-redis

This sample application in Docker demonstrates how to use Spring Session to transparently leverage Redis to back a web application’s HttpSession when using Spring Boot.


#### Sample

* [Spring Session - Spring Boot](http://docs.spring.io/spring-session/docs/current/reference/html5/guides/boot.html)
* [Sample Code](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-session-redis)

#### Build docker image

```
mvn package
mvn package docker:build
```

#### Run the application stack

```
docker-compose up
```


#### Test the application

Open the browser and access the application at http://localhost:8080/




