package vn.com.foxtek.src_tool_generate_be.services.FeGeneratorServices;

import lombok.SneakyThrows;
import org.springframework.stereotype.Service;
import vn.com.foxtek.src_tool_generate_be.constants.SystemConstants;
import vn.com.foxtek.src_tool_generate_be.services.CommonServices.GenerateFile;

import java.util.Map;

@Service
public class GenerationComponent {
    private final GenerateFile generateFile;
    public GenerationComponent(GenerateFile generateFile) {
        this.generateFile = generateFile;
    }

    // Tạo component add (thêm mới)
    final String baseOutputPath = SystemConstants.FE_COMPONENTS_FILE_PATH +"/";

    @SneakyThrows
    public void createAddComponent(Map<String, Object> data) {
        String outputPath = baseOutputPath + data.get("snakeCaseName") + "/component/add/";

        String templatePath1 = "/FE-templates/add/add-entity.component.html.ftl";
        String htmlComponentPath  = outputPath + "add-" + data.get("snakeCaseName") + ".component.html";
        generateFile.generateFile( htmlComponentPath,templatePath1, data);

        String templatePath4 = "/FE-templates/add/add-entity.component.scss.ftl";
        String scssComponentPath  = outputPath + "add-" + data.get("snakeCaseName") + ".component.scss";
        generateFile.generateFile( scssComponentPath,templatePath4, data);

        String templatePath2 = "/FE-templates/add/add-entity.component.spec.ts.ftl";
        String specComponentPath = outputPath + "add-" + data.get("snakeCaseName") + ".component.spec.ts";
        generateFile.generateFile( specComponentPath,templatePath2, data);

        String templatePath3 = "/FE-templates/add/add-entity.component.ts.ftl";
        String tsComponentPath = outputPath + "add-" + data.get("snakeCaseName") + ".component.ts";
        generateFile.generateFile( tsComponentPath, templatePath3, data);
    }

    // Tạo component bảng quản lý đối tượng
    @SneakyThrows
    public void createListComponent(Map<String, Object> data) {
        String outputPath = baseOutputPath + data.get("snakeCaseName") + "/component/list/";

        String templatePath1 = "/FE-templates/list/list-entity.component.html.ftl";
        String htmlComponentPath = outputPath + "list-" + data.get("snakeCaseName") + ".component.html";
        generateFile.generateFile( htmlComponentPath, templatePath1, data);

        String templatePath2 = "/FE-templates/list/list-entity.component.spec.ts.ftl";
        String specComponentPath = outputPath + "list-" + data.get("snakeCaseName") + ".component.spec.ts";
        generateFile.generateFile( specComponentPath, templatePath2, data);

        String templatePath3 = "/FE-templates/list/list-entity.component.ts.ftl";
        String tsComponentPath = outputPath + "list-" + data.get("snakeCaseName") + ".component.ts";
        generateFile.generateFile( tsComponentPath, templatePath3, data);

        String templatePath4 = "/FE-templates/list/list-entity.component.scss.ftl";
        String scssComponentPath  = outputPath + "list-" + data.get("snakeCaseName") + ".component.scss";
        generateFile.generateFile( scssComponentPath, templatePath4, data);
    }

    // Tạo service CRUD của đối tượng
    @SneakyThrows
    public void createServicesComponent(Map<String, Object> data) {
        String outputPath = baseOutputPath + data.get("snakeCaseName") + "/services/";

        String templatePath = "/FE-templates/services/entity.services.ts.ftl";
        String serviceComponentPath = outputPath + data.get("snakeCaseName") + ".services.ts";
        generateFile.generateFile( serviceComponentPath, templatePath, data);
    }

    // Tạo file Model của đối tượng
    @SneakyThrows
    public void createModelComponent(Map<String, Object> data) {
        String outputPath = baseOutputPath + data.get("snakeCaseName") + "/model/";

        String templatePath = "/FE-templates/model/entity.ts.ftl";
        String modelComponentPath = outputPath + data.get("snakeCaseName") + ".ts";
        generateFile.generateFile( modelComponentPath, templatePath, data);
    }

    // Tạo file Model của đối tượng
    @SneakyThrows
    public void createEntityModuleComponent(Map<String, Object> data) {
        String outputPath = baseOutputPath + data.get("snakeCaseName") + "/";

        String templatePath = "/FE-templates/module/entities.module.ts.ftl";
        String modelComponentPath = outputPath + data.get("snakeCaseName") + ".module.ts";
        generateFile.generateFile( modelComponentPath, templatePath, data);
    }

    //Tạo file module và routing
    @SneakyThrows
    public void createPageModule(Map<String, Object> data) {
        String outputPath = SystemConstants.FE_MODULE_FILE_PATH;

        String templatePath1 = "/FE-templates/page-module-and-routing/pages.module.ts.ftl";
        String pagePath = outputPath + "pages.module.ts";
        generateFile.generateFile( pagePath, templatePath1, data);

        String templatePath2 = "/FE-templates/page-module-and-routing/pages-routing.module.ts.ftl";
        String pageRoutingPath = outputPath + "pages-routing.module.ts";
        generateFile.generateFile( pageRoutingPath, templatePath2, data);
    }

}
