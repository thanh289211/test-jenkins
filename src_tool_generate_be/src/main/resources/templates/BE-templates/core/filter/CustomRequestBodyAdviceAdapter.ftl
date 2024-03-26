package ${sourceInfo.packageName}.core.filter;

import ${sourceInfo.packageName}.business.services.common.LoggingService;
import ${sourceInfo.packageName}.core.configurations.ResourcePath;
import ${sourceInfo.packageName}.helpers.utils.AssertUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.RequestBodyAdviceAdapter;

<#if springBootVersion lt 3>
import javax.servlet.http.HttpServletRequest;
<#else>
import jakarta.servlet.http.HttpServletRequest;
</#if>
import java.lang.reflect.Type;
import java.util.Arrays;

@ControllerAdvice
@Slf4j
public class CustomRequestBodyAdviceAdapter extends RequestBodyAdviceAdapter {

    @Override
    public boolean supports(MethodParameter methodParameter, Type type,
                            Class<? extends HttpMessageConverter<?>> aClass) {
        return true;
    }

    @Override
    public Object afterBodyRead(Object body, HttpInputMessage inputMessage,
                                MethodParameter parameter, Type targetType,
                                Class<? extends HttpMessageConverter<?>> converterType) {
        String uri = httpServletRequest.getRequestURI().substring(httpServletRequest.getContextPath().length());
        if (!Arrays.asList(ResourcePath.NON_LOGGING_URL_LIST).contains(uri)) {
            loggingService.logRequest(httpServletRequest, body);
        } else {
            String data =
                    "\nLOGGING REQUEST BODY-----------------------------------\n" +
                            " **Hide request body** " +
                    "\nLOGGING REQUEST BODY-----------------------------------\n";

            log.info(data);
        }
        return super.afterBodyRead(body, inputMessage, parameter, targetType, converterType);
    }

    private final LoggingService loggingService;

    private final HttpServletRequest httpServletRequest;

    @Autowired
    public CustomRequestBodyAdviceAdapter(LoggingService loggingService, HttpServletRequest httpServletRequest) {
        AssertUtils.defaultNotNull(loggingService);
        AssertUtils.defaultNotNull(httpServletRequest);
        this.loggingService = loggingService;
        this.httpServletRequest = httpServletRequest;
    }
}
