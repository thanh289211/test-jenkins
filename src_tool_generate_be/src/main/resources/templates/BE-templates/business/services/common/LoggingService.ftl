package ${sourceInfo.packageName}.business.services.common;

import ${sourceInfo.packageName}.business.request.BaseRequest;
import ${sourceInfo.packageName}.helpers.utils.mapper.GsonParserUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

<#if springBootVersion lt 3>
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<#else>
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
</#if>


@Component
@Slf4j
public class LoggingService {

    public void logRequest(HttpServletRequest httpServletRequest, Object body) {
        Object requestId = httpServletRequest.getAttribute(BaseRequest.REQUEST_ID);

        String data = "[LOGGING REQUEST BODY]:" +
                "[REQUEST-ID]: " + requestId +
                "[BODY REQUEST]: " +
                GsonParserUtils.parseObjectToString(body) +
                "[LOGGING REQUEST BODY]";
        log.info(data);
    }

    public void logResponse(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object body) {
        Object requestId = httpServletRequest.getAttribute(BaseRequest.REQUEST_ID);
        String data = "[LOGGING RESPONSE]:" +
                "[REQUEST-ID]: " + requestId +
                "[BODY RESPONSE]: " +
                GsonParserUtils.parseObjectToString(body) +
                "[END LOGGING RESPONSE]";

        log.info(data);
    }

}
