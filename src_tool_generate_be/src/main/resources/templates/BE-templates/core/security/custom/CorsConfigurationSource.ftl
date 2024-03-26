package ${sourceInfo.packageName}.core.security.custom;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.cors.CorsConfiguration;

<#if springBootVersion lt 3>
import javax.servlet.http.HttpServletRequest;
<#else>
import jakarta.servlet.http.HttpServletRequest;
</#if>
import java.util.Arrays;
import java.util.Collections;

@Component
public class CorsConfigurationSource implements org.springframework.web.cors.CorsConfigurationSource {

    private final static String ALLOWED_ORIGIN = "*";

    private final static String[] ALLOWED_METHOD = new String[]{"POST","GET","OPTIONS","PUT","PATCH","DELETE"};

    private final static boolean ALLOW_CREDENTIALS = true;

    private final static String ALLOWED_HEADER = "*";

    private final static Long MAX_AGE = 3600L;

    @Override
    public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
        CorsConfiguration cors = new CorsConfiguration();
        cors.setAllowedOriginPatterns(Collections.singletonList(ALLOWED_ORIGIN));
        cors.setAllowedMethods(Arrays.asList(ALLOWED_METHOD));
        cors.setAllowCredentials(ALLOW_CREDENTIALS);
        cors.setAllowedHeaders(Collections.singletonList(ALLOWED_HEADER));
        cors.setMaxAge(MAX_AGE);
        return cors;
    }
}
