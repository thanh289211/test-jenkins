package vn.com.foxtek.src_tool_generate_be.services.BeGeneratorServices;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Service;
import vn.com.foxtek.src_tool_generate_be.constants.SystemConstants;
import vn.com.foxtek.src_tool_generate_be.models.EntityInfo;
import vn.com.foxtek.src_tool_generate_be.request.SourceInfoRequest;
import vn.com.foxtek.src_tool_generate_be.services.CommonServices.GenerateFile;
import vn.com.foxtek.src_tool_generate_be.utils.DatabaseUtils;
import vn.com.foxtek.src_tool_generate_be.utils.FileUtils;
import vn.com.foxtek.src_tool_generate_be.utils.StringConvert;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Data
@AllArgsConstructor
public class BeGenerator {

    private final GenerateFile generateFile;

    public void generateBE(SourceInfoRequest sourceInfoRequest) throws SQLException {
        //Get table list from database
        List<EntityInfo> tables = DatabaseUtils
                .getTables(
                        sourceInfoRequest.getDatabaseUrl(),
                        sourceInfoRequest.getUsername(),
                        sourceInfoRequest.getPassword()
                );

        //Create data model
        Map<String, Object> dataModel = new HashMap<>();
        dataModel.put("sourceInfo", sourceInfoRequest);
        dataModel.put("springBootVersion", Integer.parseInt(sourceInfoRequest.getSpringVersion().split("\\.")[0]));
        dataModel.put("applicationName", StringConvert.toPascalCase(sourceInfoRequest.getArtifactID()) + "Application");

        //Generate base be
        generateBaseBE(sourceInfoRequest, dataModel);

        //Generate helper folder
        generateFile.generateFolder(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                + sourceInfoRequest.getArtifactID()
                + "/src/main/java/"
                + sourceInfoRequest.getPackageName().replace('.', '/') + "/helpers",
                "BE-templates/helpers",
                dataModel);

        //Generate core folder
        generateFile.generateFolder(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/java/"
                        + sourceInfoRequest.getPackageName().replace('.', '/') + "/core",
                "BE-templates/core",
                dataModel);

        //Generate business folder
        generateBusiness(tables, sourceInfoRequest, dataModel);
    }

    private void generateBaseBE(SourceInfoRequest sourceInfoRequest, Map<String, Object> dataModel){
        //Generate application class
        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/java/"
                        + sourceInfoRequest.getPackageName().replace('.', '/')
                        + "/" + StringConvert.toPascalCase(sourceInfoRequest.getArtifactID()) +  "Application.java", "BE-templates/ApplicationClass.ftl", dataModel);

        //Generate pom.xml
        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/pom.xml", "BE-templates/pom.ftl", dataModel);

        //Generate application.properties
        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/resources/"

                        + "application.properties", "BE-templates/application.ftl", dataModel);

        //Generate databases.properties
        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/resources/"

                        + "databases.properties", "BE-templates/databases.ftl", dataModel);
    }

    private void generateBusiness(List<EntityInfo> tables, SourceInfoRequest sourceInfoRequest, Map<String, Object> dataModel){
        generateEntities(tables, sourceInfoRequest, dataModel);
        generateRepositories(tables, sourceInfoRequest, dataModel);
        generateRepositories(tables, sourceInfoRequest, dataModel);
        generateRequestModels(tables, sourceInfoRequest, dataModel);
        generateFile.generateFile(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                + sourceInfoRequest.getArtifactID()
                + "/src/main/java/"
                + sourceInfoRequest.getPackageName().replace('.', '/')
                + "/business/response/BaseResponse.java", "BE-templates/business/response/BaseResponse.ftl", dataModel);
        generateServices(tables, sourceInfoRequest, dataModel);
        generateControllers(tables, sourceInfoRequest, dataModel);
    }

    private void generateEntities(List<EntityInfo> tables, SourceInfoRequest sourceInfoRequest, Map<String, Object> dataModel){
        //Generate entity AuditTable
        generateFile.generateFile(
        SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                + sourceInfoRequest.getArtifactID()
                + "/src/main/java/"
                + sourceInfoRequest.getPackageName().replace('.', '/')
                + "/business/entities/AuditTable.java",
                "BE-templates/business/entities/AuditTable.ftl", dataModel);

        //Generate entity BaseEntity
        generateFile.generateFile(
        SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                + sourceInfoRequest.getArtifactID()
                + "/src/main/java/"
                + sourceInfoRequest.getPackageName().replace('.', '/')
                + "/business/entities/BaseEntity.java",
                "BE-templates/business/entities/BaseEntity.ftl", dataModel);

        //Generate entities base on the database tables
        for (EntityInfo table : tables) {
            //Add new data model
            dataModel.put("entityInfo", table);

            //Generate entity class
            generateFile.generateFile(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                            + sourceInfoRequest.getArtifactID()
                            + "/src/main/java/"
                            + sourceInfoRequest.getPackageName().replace('.', '/')
                            + "/business/entities/" + table.getClassName() + ".java"
                    , "BE-templates/business/entities/EntityTemplate.ftl"
                    , dataModel);
        }
    }

    private void generateRepositories(List<EntityInfo> tables, SourceInfoRequest sourceInfoRequest, Map<String, Object> dataModel){
        //Generate base repository class
        generateFile.generateFile(
        SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                + sourceInfoRequest.getArtifactID()
                + "/src/main/java/"
                + sourceInfoRequest.getPackageName().replace('.', '/')
                + "/business/repositories/BaseRepository.java",
                "BE-templates/business/repositories/BaseRepository.ftl", dataModel);

        //Generate repository base on the entities
        for (EntityInfo table : tables) {
            //Add new data model
            dataModel.put("entityInfo", table);

            //Generate repository class
            generateFile.generateFile(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                            + sourceInfoRequest.getArtifactID()
                            + "/src/main/java/"
                            + sourceInfoRequest.getPackageName().replace('.', '/')
                            + "/business/repositories/" + table.getClassName() + "Repository.java"
                    , "BE-templates/business/repositories/EntityRepositoryTemplate.ftl"
                    , dataModel);
        }
    }

    private void generateRequestModels(List<EntityInfo> tables, SourceInfoRequest sourceInfoRequest, Map<String, Object> dataModel){
        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/java/"
                        + sourceInfoRequest.getPackageName().replace('.', '/')
                        + "/business/request/BaseRequest.java"
                , "BE-templates/business/request/BaseRequest.ftl"
                , dataModel);

        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/java/"
                        + sourceInfoRequest.getPackageName().replace('.', '/')
                        + "/business/request/PageRequest.java"
                , "BE-templates/business/request/PageRequest.ftl"
                , dataModel);

        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/java/"
                        + sourceInfoRequest.getPackageName().replace('.', '/')
                        + "/business/request/SearchRequest.java"
                , "BE-templates/business/request/SearchRequest.ftl"
                , dataModel);

        for (EntityInfo table : tables){
            generateFile.generateFile(
                    SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                            + sourceInfoRequest.getArtifactID()
                            + "/src/main/java/"
                            + sourceInfoRequest.getPackageName().replace('.', '/')
                            + "/business/request/" + table.getClassName() + "Request.java"
                    , "BE-templates/business/request/EntityRequestTemplate.ftl"
                    , dataModel);
        }
    }

    private void generateServices(List<EntityInfo> tables, SourceInfoRequest sourceInfoRequest, Map<String, Object> dataModel){
        //Generate base service class
        generateFile.generateFile(
        SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                + sourceInfoRequest.getArtifactID()
                + "/src/main/java/"
                + sourceInfoRequest.getPackageName().replace('.', '/')
                + "/business/services/base/BaseService.java"
                , "BE-templates/business/services/base/BaseService.ftl"
                , dataModel);

        //Generate base service implement class
        generateFile.generateFile(
        SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                + sourceInfoRequest.getArtifactID()
                + "/src/main/java/"
                + sourceInfoRequest.getPackageName().replace('.', '/')
                + "/business/services/base/implement/BaseServiceImpl.java"
                , "BE-templates/business/services/base/implement/BaseServiceImpl.ftl"
                , dataModel);
        //Generate common
        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/java/"
                        + sourceInfoRequest.getPackageName().replace('.', '/')
                        + "/business/services/common/LoggingService.java"
                , "BE-templates/business/services/common/LoggingService.ftl"
                , dataModel);

        //Generate service base on the entities
        for (EntityInfo table : tables) {
            //Add new data model
            dataModel.put("entityInfo", table);

            //Generate service class
            generateFile.generateFile(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                            + sourceInfoRequest.getArtifactID()
                            + "/src/main/java/"
                            + sourceInfoRequest.getPackageName().replace('.', '/')
                            + "/business/services/" + table.getClassName() + "Service.java"
                    , "BE-templates/business/services/EntityServiceTemplate.ftl"
                    , dataModel);

            //Generate service implement class
            generateFile.generateFile(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                    + sourceInfoRequest.getArtifactID()
                    + "/src/main/java/"
                    + sourceInfoRequest.getPackageName().replace('.', '/')
                    + "/business/services/implement/" + table.getClassName() + "ServiceImpl.java"
                    , "BE-templates/business/services/implement/EntityServiceImplTemplate.ftl"
                    , dataModel);
        }
    }

    private void generateControllers(List<EntityInfo> tables, SourceInfoRequest sourceInfoRequest, Map<String, Object> dataModel){
        //Generate base repository class
        generateFile.generateFile(
                SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                        + sourceInfoRequest.getArtifactID()
                        + "/src/main/java/"
                        + sourceInfoRequest.getPackageName().replace('.', '/')
                        + "/business/controllers/BaseController.java", "BE-templates/business/controllers/BaseController.ftl", dataModel);

        //Generate repository base on the entities
        for (EntityInfo table : tables) {
            dataModel.put("path", StringConvert.toSnakeCase(table.getTableName()));

            //Generate repository class
            generateFile.generateFile(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH
                            + sourceInfoRequest.getArtifactID()
                            + "/src/main/java/"
                            + sourceInfoRequest.getPackageName().replace('.', '/')
                            + "/business/controllers/" + table.getClassName() + "Controller.java"
                    , "BE-templates/business/controllers/EntityControllerTemplate.ftl"
                    , dataModel);
        }
    }
}
