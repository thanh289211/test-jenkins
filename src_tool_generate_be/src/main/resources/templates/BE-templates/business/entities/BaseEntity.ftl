package ${sourceInfo.packageName}.business.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnore;
import ${sourceInfo.packageName}.helpers.constants.BusinessConstants;
<#if springBootVersion lt 3>
import javax.persistence.*;
<#else>
import jakarta.persistence.*;
</#if>

@Data
@AllArgsConstructor
@NoArgsConstructor
@MappedSuperclass
public class BaseEntity extends AuditTable{
    @Column(name = "client_id")
    @JsonIgnore
    private String clientId;

    @Column(name = "status")
    @JsonIgnore
    private Integer status = BusinessConstants.Status.ACTIVE;

    @Column(name = "is_delete")
    @JsonIgnore
    private Integer delete = BusinessConstants.Delete.NOT_DELETE;
}