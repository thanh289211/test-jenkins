package ${sourceInfo.packageName}.core.exceptions;

import ${sourceInfo.packageName}.helpers.enums.responseStatus.ResponseStatus;

public class UniqueException extends SystemException {
    private static final long serialVersionUID = 1L;

    private final static ResponseStatus ERROR_TYPE = ResponseStatus.UNKNOWN;

    public UniqueException() {
        super(ERROR_TYPE);
    }

    public UniqueException(String message) {
        super(ERROR_TYPE, message);
    }
}
