FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y maven

# Build the project
RUN mvn clean package -DskipTests

# 💥 Add this debug step to inspect the contents of target
RUN echo "📁 Contents of /app/target:" && ls -la /app/target

# 💥 Also check current working dir
RUN echo "📁 Current dir:" && pwd && echo "📁 Full contents:" && ls -laR /app

EXPOSE 8080

CMD ["java", "-jar", "target/midjourney-proxy-2.6.3.jar"]
