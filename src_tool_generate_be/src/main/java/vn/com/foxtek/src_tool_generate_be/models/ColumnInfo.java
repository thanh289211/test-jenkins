package vn.com.foxtek.src_tool_generate_be.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ColumnInfo {
    private String columnName;
    private String columnType;
    private String javaType;
    private String entityName;
    private boolean unique;

    public ColumnInfo(String camelCase) {
    }
}
