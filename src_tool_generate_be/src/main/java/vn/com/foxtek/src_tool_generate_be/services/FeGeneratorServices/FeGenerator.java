package vn.com.foxtek.src_tool_generate_be.services.FeGeneratorServices;


import org.springframework.stereotype.Service;
import vn.com.foxtek.src_tool_generate_be.models.ColumnInfo;
import vn.com.foxtek.src_tool_generate_be.models.EntityInfo;
import vn.com.foxtek.src_tool_generate_be.request.SourceInfoRequest;
import vn.com.foxtek.src_tool_generate_be.utils.DatabaseUtils;
import vn.com.foxtek.src_tool_generate_be.utils.StringConvert;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class FeGenerator {
    private final StringConvert stringConvert;
    private final GenerationComponent generationComponent;

    public FeGenerator(StringConvert stringConvert, GenerationComponent generationComponent) {
        this.stringConvert = stringConvert;
        this.generationComponent = generationComponent;
    }

    public void generateFe(SourceInfoRequest sourceInfoRequest) throws SQLException {
        List<EntityInfo> tables = DatabaseUtils
                .getTables(
                        sourceInfoRequest.getDatabaseUrl(),
                        sourceInfoRequest.getUsername(),
                        sourceInfoRequest.getPassword()
                );
        tables.forEach(this::generateFileComponentFromTemplate);
        generateFileModuleFromTemplate(tables);
    }

    public void generateFileComponentFromTemplate(EntityInfo entity){

        Map<String, Object> data = new HashMap<>();
        data.put("snakeCaseName", stringConvert.toSnakeCase(entity.getTableName()));
        data.put("pascalCaseName", StringConvert.toPascalCase(entity.getTableName()));
        data.put("titleCaseName", StringConvert.toTitleCase(entity.getTableName()));
        data.put("camelCaseName", StringConvert.toCamelCase(entity.getTableName()));
        data.put("properties", entity.getColumns());

        generationComponent.createServicesComponent(data);
        generationComponent.createAddComponent(data);
        generationComponent.createListComponent(data);
        generationComponent.createServicesComponent(data);
        generationComponent.createModelComponent(data);
        generationComponent.createEntityModuleComponent(data);
    }

    public void generateFileModuleFromTemplate(List<EntityInfo> entities) {
        List<Map<String, Object>> entityNameList = new ArrayList<>();
        entities.forEach(entity -> {
            Map<String, Object> entityName = new HashMap<>();
            entityName.put("snakeCaseName", stringConvert.toSnakeCase(entity.getTableName()));
            entityName.put("pascalCaseName", StringConvert.toPascalCase(entity.getTableName()));
            entityNameList.add(entityName);
        });
        Map<String, Object> data = new HashMap<>();
        data.put("entities", entityNameList);
        generationComponent.createPageModule(data);
    }


}
