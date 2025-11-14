# ---- Build stage ----
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package -DskipTests

# ---- Runtime stage ----
FROM amazoncorretto:21-alpine
WORKDIR /app
# (optional) run as non-root
RUN addgroup -S app && adduser -S app -G app
USER app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENV JAVA_OPTS=""
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
