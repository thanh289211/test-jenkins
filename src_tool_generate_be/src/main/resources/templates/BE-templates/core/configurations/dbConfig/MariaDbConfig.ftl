package ${sourceInfo.packageName}.core.configurations.dbConfig.maria;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@PropertySource({"classpath:databases.properties"})
@Configuration
public class MariaDbConfig {
}