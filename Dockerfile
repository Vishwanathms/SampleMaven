FROM maven:3.8.5-openjdk AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src 
RUN mvn clean install -DskipTests


FROM vishwacloudlab/tomcatcust01:latest
# Take the war and copy to webapps of tomcat
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
