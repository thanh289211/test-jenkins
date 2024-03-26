package ${sourceInfo.packageName}.business.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import ${sourceInfo.packageName}.business.request.BaseRequest;
import ${sourceInfo.packageName}.helpers.enums.responseStatus.IResponseStatus;
import ${sourceInfo.packageName}.helpers.enums.responseStatus.ResponseStatus;
import ${sourceInfo.packageName}.helpers.utils.mapper.GsonParserUtils;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

<#if springBootVersion lt 3>
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<#else>
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
</#if>
import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

import static ${sourceInfo.packageName}.helpers.utils.Utils.createTimestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BaseResponse implements Serializable {
    private String requestId;
    private Timestamp timestamp;
    private String messageCode;
    private List<String> message;
    private Object data;
    private Object optional;

    public static BaseResponse success(Object data) {
        return success(ResponseStatus.SUCCESS.message(), data, null);
    }


    public static BaseResponse success(String message, Object data, Object optional) {
        return BaseResponse.builder()
             .messageCode(ResponseStatus.SUCCESS.messageCode())
             .message(Collections.singletonList(message))
             .data(data)
             .optional(optional)
             .timestamp(createTimestamp())
             .build();
    }

    public static BaseResponse error(String message) {
        return error(ResponseStatus.SYSTEM_ERROR, message);
    }

    public static BaseResponse error(IResponseStatus error) {
        return BaseResponse.builder()
            .messageCode(error.messageCode())
            .message(Collections.singletonList(error.message()))
            .timestamp(createTimestamp())
            .build();
    }

    public static BaseResponse error(IResponseStatus error, String message) {
        return BaseResponse.builder()
           .messageCode(error.messageCode())
           .message(Collections.singletonList(message))
           .timestamp(createTimestamp())
           .build();
    }

    public static BaseResponse error(IResponseStatus error, List<String> message) {
        return BaseResponse.builder()
            .messageCode(error.messageCode())
            .message(message)
            .timestamp(createTimestamp())
            .build();
    }

    public static BaseResponse error(IResponseStatus error, String message, Object data) {
        return BaseResponse.builder()
            .messageCode(error.messageCode())
            .message(Collections.singletonList(message))
            .data(data)
            .timestamp(createTimestamp())
            .build();
    }

    public static BaseResponse error(IResponseStatus error, List<String> message, Object data) {
        return BaseResponse.builder()
            .messageCode(error.messageCode())
            .message(message)
            .data(data)
            .timestamp(createTimestamp())
            .build();
    }
    public static void buildResponse(HttpServletRequest request, HttpServletResponse response, IResponseStatus state) throws IOException {
        Object requestId = request.getAttribute(BaseRequest.REQUEST_ID);
        buildResponse(response, state.messageCode(), state.message(), requestId.toString());
    }

    public static void buildResponse(HttpServletResponse response, IResponseStatus state, String requestId) throws IOException {
        buildResponse(response, state.messageCode(), state.message(), requestId);
    }

    public static void buildResponse(HttpServletResponse response, IResponseStatus state) throws IOException {
        buildResponse(response, state.messageCode(), state.message(), null);
    }

    private static void buildResponse(HttpServletResponse response, String messageCode, String message) throws IOException {
        buildResponse(response, messageCode, message, null);
    }

    private static void buildResponse(HttpServletResponse response, String messageCode, String message, String requestId) throws IOException {
       response.setContentType("application/json;charset=UTF-8");
       BaseResponse baseResponse = BaseResponse.builder()
           .requestId(requestId)
           .timestamp(createTimestamp())
           .messageCode(messageCode)
           .message(Collections.singletonList(message)).build();
       response.getWriter().write(GsonParserUtils.parseObjectToString(baseResponse));
    }
}
