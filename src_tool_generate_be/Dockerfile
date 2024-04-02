FROM openjdk:17
ARG PROJECT_VERSION=0.1.0
RUN mkdir -p /home/app
WORKDIR /home/app
ENV SPRING_PROFILES_ACTIVE dev
ADD target/src_tool_generate_be-${PROJECT_VERSION}.jar src_tool_generate_be.jar
EXPOSE 8082
ENTRYPOINT ["java", "-Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}", "-jar", "src_tool_generate_be.jar"]