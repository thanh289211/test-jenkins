package vn.com.foxtek.src_tool_generate_be.enums;

public interface IResponseStatus {
    String message();

    String messageCode();

    default IResponseStatus setMessage(String message) {
        return null;
    }
}
