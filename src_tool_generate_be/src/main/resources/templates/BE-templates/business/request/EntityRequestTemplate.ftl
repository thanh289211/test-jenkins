package ${sourceInfo.packageName}.business.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ${entityInfo.className}Request extends BaseRequest{
<#list entityInfo.columns as column>
    private ${column.javaType} ${column.entityName};
</#list>
}

