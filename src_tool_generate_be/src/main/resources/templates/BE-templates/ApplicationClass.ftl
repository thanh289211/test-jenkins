package ${sourceInfo.packageName};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.context.annotation.Configuration;

@Configuration
@SpringBootApplication()
public class ${applicationName} {

    public static void main(String[] args) {
        SpringApplication.run(${applicationName}.class, args);
    }
}

