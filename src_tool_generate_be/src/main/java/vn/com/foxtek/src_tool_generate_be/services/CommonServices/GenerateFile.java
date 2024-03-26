package vn.com.foxtek.src_tool_generate_be.services.CommonServices;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import vn.com.foxtek.src_tool_generate_be.utils.FileUtils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;

@Service
public class GenerateFile {

//    Configuration configuration = new Configuration(Configuration.VERSION_2_3_31);
//    @SneakyThrows
//    public void createPathAndFile(String templatePath, String outputPath, Map<String, Object> data) {
//        configuration.setClassForTemplateLoading(GenerationTemplateFiles.class, "/templates");
//        Template template = configuration.getTemplate(templatePath);
//        // Tạo đối tượng Path từ đường dẫn đích
//        Path outputFilePath = Paths.get(outputPath);
//        // Tạo các thư mục cha nếu chúng không tồn tại
//        Files.createDirectories(outputFilePath.getParent());
//        // Ghi kết quả vào tệp
//        Writer fileWriter = new FileWriter(new File(outputPath));
//        template.process(data, fileWriter);
//        fileWriter.close();
//    }

    private final FreeMarkerConfigurer freeMarkerConfig;
    public GenerateFile(FreeMarkerConfigurer freeMarkerConfig) {
        this.freeMarkerConfig = freeMarkerConfig;
    }

    public void generateFile(String outputPath, String templateFile, Map<String, Object> dataModel){
        try{
            Template template = freeMarkerConfig.getConfiguration().getTemplate(templateFile);
            File file = new File(outputPath);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
            try (FileWriter fileWriter = new FileWriter(file)) {
                template.process(dataModel, fileWriter);
            } catch (TemplateException e) {
                throw new RuntimeException(e);
            }
        }catch (IOException e){
            throw new RuntimeException(e);
        }
    }

    public void generateFolder(String outputPath, String templateFolderPath, Map<String, Object> dataModel){
        File folder = new File("src/main/resources/templates/" + templateFolderPath);
        if (folder.exists() && folder.isDirectory()) {
            // Lấy danh sách các tệp và thư mục con trong thư mục
            File[] files = folder.listFiles();
            if (files != null) {
                for (File file : files) {
                    // Nếu là thư mục, gọi đệ quy để duyệt thư mục con
                    if (file.isDirectory()) {
                        generateFolder(outputPath + "/" + file.getName(),
                                templateFolderPath + "/" + file.getName(),
                                dataModel);
                    } else {
                        // Nếu là tệp, in ra tên của tệp
                        generateFile(outputPath + "/" + FileUtils.getNameIgnoreType(file.getName()) + ".java",
                                templateFolderPath + "/" + file.getName(), dataModel);
                    }
                }
            }
        }
    }

}
