FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/taget/helloworld-1.1.jar /app/
EXPOSE 9090
CMD [ "java", "-jar" , "helloworld-1.1.jar"]
