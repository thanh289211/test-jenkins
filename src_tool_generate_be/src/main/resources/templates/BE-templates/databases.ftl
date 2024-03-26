#MongoDB config


#MariaDB config
spring.datasource.url=${sourceInfo.databaseUrl}
spring.datasource.username=${sourceInfo.username}
spring.datasource.password=${sourceInfo.password}

#Oracle config


#PostgreSQL config


#Hikari pool
spring.datasource.hikari.connection-timeout=20000
spring.datasource.hikari.maximum-pool-size=5
spring.datasource.hikari.minimum-idle=2
spring.datasource.hikari.idle-timeout=30000
logging.level.com.zaxxer.hikari.HikariConfig=DEBUG
logging.level.com.zaxxer.hikari.HikariDataSource=DEBUG


# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MariaDBDialect