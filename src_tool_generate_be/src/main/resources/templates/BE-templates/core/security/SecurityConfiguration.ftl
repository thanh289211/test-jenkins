package ${sourceInfo.packageName}.core.security;

import ${sourceInfo.packageName}.core.security.custom.CorsConfigurationSource;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

@Configuration
//@EnableWebSecurity(debug = true)
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    /*@Bean
    public PasswordEncoder passwordEncoder() {
        return new VSafePasswordEncoder();
    }*/
    private final CorsConfigurationSource corsConfigurationSource;

    public SecurityConfiguration(CorsConfigurationSource corsConfigurationSource) {
        this.corsConfigurationSource = corsConfigurationSource;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors().configurationSource(corsConfigurationSource)
                .and()
                .csrf().disable()
                .exceptionHandling()
                .and()
                .authorizeRequests()
                .antMatchers("/v1/**").permitAll()
                .antMatchers("/v1/web-socket/**").permitAll()
                .antMatchers("/v1/authentication/login").permitAll()
                .antMatchers("/v1/authentication/cms-login").permitAll()
                .anyRequest().authenticated()
                .and().sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }
}
