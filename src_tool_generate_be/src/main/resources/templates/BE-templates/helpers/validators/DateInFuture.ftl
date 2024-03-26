package ${sourceInfo.packageName}.helpers.validators;

<#if springBootVersion lt 3>
import javax.validation.Constraint;
import javax.validation.Payload;
<#else>
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
</#if>
import java.lang.annotation.*;


@Documented
@Constraint(validatedBy = DateInFutureValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface DateInFuture {
    String message() default "Invalid date";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
