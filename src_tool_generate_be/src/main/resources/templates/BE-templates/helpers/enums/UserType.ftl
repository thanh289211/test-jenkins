package ${sourceInfo.packageName}.helpers.enums;

import ${sourceInfo.packageName}.helpers.utils.AssertUtils;

public enum UserType implements CommonEnum<Integer, String>{
    CUSTOMER(0, "CUSTOMER"),//Tài khoản khách hàng
    INTERNAL(1, "INTERNAL");//Tài khoản nội bộ

    private Integer type;
    private String name;
    UserType(Integer type, String name) {
        this.type = type;
        this.name = name;
    }

    @Override
    public Integer getValue() {
        return type;
    }

    @Override
    public String getName() {
        return name;
    }

    public static UserType getUserType(Integer value) {
        AssertUtils.defaultNotNull(value);
        for (UserType type: values()) {
            if (type.getValue().equals(value))
                return type;
        }
        return null;
    }
}
