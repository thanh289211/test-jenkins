package ${sourceInfo.packageName}.helpers.enums.responseStatus;

public interface IResponseStatus {
    String message();

    String messageCode();

    default IResponseStatus setMessage(String message) {
        return null;
    }

}
