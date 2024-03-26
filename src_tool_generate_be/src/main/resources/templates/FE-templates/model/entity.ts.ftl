export interface ${pascalCaseName} {
<#assign id = "id">
<#list properties as property>
    <#assign columnName = property.entityName>
    <#if columnName == id>
        id: number;
    <#else>
        ${property.entityName}: string;
    </#if>
</#list>
}