package ${sourceInfo.packageName}.helpers.validators;

import ${sourceInfo.packageName}.helpers.enums.CommonEnum;

<#if springBootVersion lt 3>
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
<#else>
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
</#if>
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class ValueOfEnumValidator implements ConstraintValidator<ValueOfEnum, Object> {
    private List<Object> acceptedValues;

    @Override
    public void initialize(ValueOfEnum annotation) {
        acceptedValues = Stream.of(annotation.enumClass().getEnumConstants())
                .map(CommonEnum::getValue)
                .collect(Collectors.toList());
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        if (value == null) {
            return true;
        }

        return acceptedValues.contains(value);
    }
}
