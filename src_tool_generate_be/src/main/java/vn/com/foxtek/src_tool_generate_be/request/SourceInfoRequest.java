package vn.com.foxtek.src_tool_generate_be.request;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class SourceInfoRequest extends BaseRequest{
    private String artifactID;
    private String groupId;
    private String springVersion;
    private String angularVersion;
    private String javaVersion;
    private String name;
    private String description;
    private String packageName;
    private String databaseUrl;
    private String username;
    private String password;
}
