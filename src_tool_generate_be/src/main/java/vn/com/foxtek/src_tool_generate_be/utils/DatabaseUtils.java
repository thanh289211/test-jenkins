package vn.com.foxtek.src_tool_generate_be.utils;

import vn.com.foxtek.src_tool_generate_be.models.ColumnInfo;
import vn.com.foxtek.src_tool_generate_be.models.EntityInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtils {

    public static List<EntityInfo> getTables(String jdbcUrl, String username, String password) throws SQLException {
        List<EntityInfo> tables = new ArrayList<>();
        Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
        DatabaseMetaData metaData = connection.getMetaData();
        ResultSet tableResultSet = metaData.getTables(null, null, "user_entity", new String[]{"TABLE"});

        while (tableResultSet.next()) {
            String tableName = tableResultSet.getString("TABLE_NAME");
            List<ColumnInfo> columns = getColumns(metaData, tableName);
            EntityInfo entityInfo = new EntityInfo(
                    tableName,
                    StringConvert.toPascalCase(tableName),
                    columns,
                    tableName.toUpperCase() + "_SEQ",
                    tableName.toUpperCase() + "_SEQ"
            );
            tables.add(entityInfo);
        }
        return tables;
    }

    public static List<ColumnInfo> getColumns(DatabaseMetaData metaData, String tableName) throws SQLException {
        List<ColumnInfo> columns = new ArrayList<>();
        ResultSet columnResultSet = metaData.getColumns(null, null, tableName, null);
        while (columnResultSet.next()) {
            String columnName = columnResultSet.getString("COLUMN_NAME");
            String columnType = columnResultSet.getString("TYPE_NAME");
            if (!isIgnoredColumn(columnName)) {
                ColumnInfo columnInfo = new ColumnInfo();
                columnInfo.setColumnName(columnName);
                columnInfo.setColumnType(columnType);
                columnInfo.setUnique(false);
                if (columnName.equalsIgnoreCase("id")){
                    columnInfo.setJavaType("long");
                }else{
                    columnInfo.setJavaType(convertColumnTypeToEntityType(columnType));
                }
                columnInfo.setEntityName(StringConvert.toCamelCase(columnName));
                columns.add(columnInfo);
            }
        }
        return columns;
    }

    private static String convertColumnTypeToEntityType(String columnType) {
        columnType = columnType.toLowerCase();

        if (columnType.contains("varchar") || columnType.contains("text")) {
            return "String";
        } else if (columnType.contains("int") || columnType.contains("number")) {
            return "Integer";
        } else if (columnType.contains("decimal") || columnType.contains("numeric") || columnType.contains("double")) {
            return "Double";
        } else if (columnType.contains("float")) {
            return "Float";
        } else if (columnType.contains("date") || columnType.contains("time")) {
            return "java.util.Date";
        } else if (columnType.contains("boolean")) {
            return "Boolean";
        } else {
            return "Object"; // Default to Object type for unknown column types
        }
    }

    private static boolean isIgnoredColumn(String columnName) {
        String[] ignoredColumns = {"created_by", "created_date", "updated_date", "updated_by", "is_delete", "client_id", "status"};
        for (String ignoredColumn : ignoredColumns) {
            if (columnName.equalsIgnoreCase(ignoredColumn)) {
                return true;
            }
        }
        return false;
    }
}
