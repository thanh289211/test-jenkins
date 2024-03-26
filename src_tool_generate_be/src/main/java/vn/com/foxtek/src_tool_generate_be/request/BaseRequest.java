package vn.com.foxtek.src_tool_generate_be.request;

import lombok.Data;
import vn.com.foxtek.src_tool_generate_be.constants.SystemConstants;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
@Data
public class BaseRequest {
    public static final String REQUEST_ID = "request_id";

    private String requestId = UUID.randomUUID().toString();

    private String requestDate = new SimpleDateFormat(SystemConstants.Date.BASE_DATE_FULL_TIME_FORMAT).format(new Date());
}
