package ${sourceInfo.packageName}.core.exceptions;


import ${sourceInfo.packageName}.helpers.enums.responseStatus.ResponseStatus;

public class UnknownException extends SystemException {
    private static final long serialVersionUID = -7431810328087316293L;

    private final static ResponseStatus ERROR_TYPE = ResponseStatus.UNKNOWN;

    public UnknownException() {
        super(ERROR_TYPE);
    }
}
