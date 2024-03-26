package ${sourceInfo.packageName}.helpers.enums;

import ${sourceInfo.packageName}.helpers.utils.AssertUtils;
import ${sourceInfo.packageName}.helpers.utils.Utils;

public interface CommonEnum<T, F> {
    T getValue();

    F getName();


    default boolean isEqual(T value) {
        AssertUtils.defaultNotNull(value);
        if (value instanceof Number)
            return Utils.nvl(value, "").equals(Utils.nvl(this.getValue(), ""));
        return Utils.nvl(value, -1).equals(Utils.nvl(this.getValue(), -1));
    }

}

