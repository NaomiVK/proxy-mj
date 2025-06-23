FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y maven

RUN mvn clean package -DskipTests

# 🕵️ Show what’s inside target/
RUN ls -la target/

EXPOSE 8080

CMD ["java", "-jar", "target/midjourney-proxy-*.jar"]
