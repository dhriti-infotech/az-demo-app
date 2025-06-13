# ---- Build Stage ----
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copy Gradle wrapper files and build dependencies first
COPY gradlew build.gradle settings.gradle ./
COPY gradle gradle
RUN ./gradlew build -x test || return 0  # to pre-download dependencies

# Copy everything else and build the app
COPY . .
RUN ./gradlew clean build -x test

# ---- Runtime Stage ----
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
