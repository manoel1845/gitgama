FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY . /tmp_build
WORKDIR /tmp_build
RUN ./mvnw -T 1C clean install -Dmaven.test.skip -DskipTests -Dmaven.javadoc.skip=true && cp ${JAR_FILE} /app.jar && rm -rf *
ENTRYPOINT ["java","-jar","/app.jar"]
