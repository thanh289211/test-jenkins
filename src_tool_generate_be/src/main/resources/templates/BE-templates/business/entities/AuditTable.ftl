package ${sourceInfo.packageName}.business.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
<#if springBootVersion lt 3>
import javax.persistence.*;
<#else>
import jakarta.persistence.*;
</#if>
import java.util.Date;

@MappedSuperclass
@Data
public class AuditTable {

    @CreatedDate
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    @JsonIgnore
    private Date createdDate;

    @LastModifiedDate
    @Column(name = "updated_date")
    @Temporal(TemporalType.TIMESTAMP)
    @JsonIgnore
    private Date updatedDate;

    @CreatedBy
    @Column(name = "created_by")
    @JsonIgnore
    private Long createdBy;

    @LastModifiedBy
    @Column(name = "updated_by")
    @JsonIgnore
    private Long updatedBy;

}