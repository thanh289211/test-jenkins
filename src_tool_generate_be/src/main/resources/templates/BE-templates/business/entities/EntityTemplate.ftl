package ${sourceInfo.packageName}.business.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

<#if springBootVersion lt 3>
import javax.persistence.*;
<#else>
import jakarta.persistence.*;
</#if>

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ${entityInfo.className} extends BaseEntity{
    <#list entityInfo.columns as column>
        <#if column.columnName != "id">
        @Column(name = "${column.columnName}<#if column.unique>, unique = true</#if>")
        <#else>
        @Id
        @GeneratedValue(generator = "${entityInfo.generatorName}", strategy = GenerationType.SEQUENCE)
        @SequenceGenerator(name = "${entityInfo.generatorName}", sequenceName = "${entityInfo.sequenceName}", allocationSize = 1)
        </#if>
        private ${column.javaType} ${column.entityName};
    </#list>
}