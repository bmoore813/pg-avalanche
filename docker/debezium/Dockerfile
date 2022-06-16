FROM builder as builder

FROM eclipse-temurin:11-jre
COPY --from=builder /app/appdist/debezium-server-iceberg/ /app/
COPY application.properties /app/conf/application.properties

WORKDIR /app
EXPOSE 8080 8083
VOLUME ["/app/conf", "/app/data"] 

ENTRYPOINT ["/app/run.sh"]