package vn.com.foxtek.src_tool_generate_be.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EntityInfo {
    private String tableName;
    private String className;
    private List<ColumnInfo> columns;
    private String generatorName;
    private String sequenceName;
}
