# Dev: usa Maven e JDK para rodar spring-boot:run
FROM maven:3.9.8-eclipse-temurin-21-alpine


WORKDIR /app

# Copia só os arquivos de build primeiro pra aproveitar cache de deps
COPY pom.xml ./

# Baixa dependências (cache)
RUN mvn -q dependency:go-offline

# Na hora de subir pelo docker-compose vamos montar o código via volume
EXPOSE 8080

# Mantém o processo em foreground e acelera o ciclo de reinício
CMD ["mvn", "-q", "spring-boot:run", "-Dspring-boot.run.fork=false"]
