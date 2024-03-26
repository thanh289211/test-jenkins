package ${sourceInfo.packageName}.helpers.validators;

import ${sourceInfo.packageName}.helpers.enums.CommonEnum;

<#if springBootVersion lt 3>
import javax.validation.Constraint;
import javax.validation.Payload;
<#else>
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
</#if>
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE})
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = ValueOfEnumValidator.class)
public @interface ValueOfEnum {
    Class<? extends CommonEnum> enumClass();

    String message() default "Giá trị không hợp lệ";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
