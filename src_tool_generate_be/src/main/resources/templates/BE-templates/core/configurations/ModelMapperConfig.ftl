package ${sourceInfo.packageName}.core.configurations;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ModelMapperConfig {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.getConfiguration()
                .setDeepCopyEnabled(true)
                .setMatchingStrategy(MatchingStrategies.STRICT);
//                .setSkipNullEnabled(true);
        return modelMapper;
    }

}
