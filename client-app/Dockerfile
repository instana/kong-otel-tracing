FROM azul/zulu-openjdk:11 AS kong-tracing-client-app-build

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y --no-install-recommends --no-install-suggests \
    curl ca-certificates

WORKDIR /opt/client-app/
COPY . .
RUN ./mvnw clean package

FROM azul/zulu-openjdk:11

VOLUME /tmp
WORKDIR /opt/client-app/
ARG JAR_FILE=target/client-app-1.0.0.RELEASE.jar
COPY --from=kong-tracing-client-app-build /opt/client-app/${JAR_FILE} ./app.jar

RUN apt-get update -y && apt-get install -y --no-install-recommends --no-install-suggests \
    curl ca-certificates wget iputils-ping

ENTRYPOINT ["java","-jar","app.jar"]
