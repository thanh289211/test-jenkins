package ${sourceInfo.packageName}.core.configurations;

import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import ${sourceInfo.packageName}.helpers.constants.SystemConstants;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

import java.time.format.DateTimeFormatter;

@Configuration
public class FormatDateConfig {
    @Bean
    @ConditionalOnProperty(value = "spring.jackson.date-format", matchIfMissing = true, havingValue = "none")
    public Jackson2ObjectMapperBuilderCustomizer jsonCustomizer() {
        return new Jackson2ObjectMapperBuilderCustomizer() {
            @Override
            public void customize(Jackson2ObjectMapperBuilder builder) {
                builder.simpleDateFormat(SystemConstants.Date.BASE_DATE_FULL_TIME_FORMAT);
                builder.serializers(new LocalDateSerializer(DateTimeFormatter.ofPattern(SystemConstants.Date.BASE_DATE_FORMAT)));
                builder.serializers(new LocalDateTimeSerializer(DateTimeFormatter.ofPattern(SystemConstants.Date.BASE_DATE_FULL_TIME_FORMAT)));
            }
        };
    }
}
