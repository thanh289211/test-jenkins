package vn.com.foxtek.src_tool_generate_be.services;

import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import vn.com.foxtek.src_tool_generate_be.constants.SystemConstants;
import vn.com.foxtek.src_tool_generate_be.request.SourceInfoRequest;
import vn.com.foxtek.src_tool_generate_be.services.BeGeneratorServices.BeGenerator;
import vn.com.foxtek.src_tool_generate_be.services.FeGeneratorServices.FeGenerator;
import vn.com.foxtek.src_tool_generate_be.utils.FileUtils;

import java.io.IOException;
import java.sql.SQLException;

@Service
public class ProjectGenerateServices {
    private final BeGenerator beGenerator;
    private final FeGenerator feGenerator;

    public ProjectGenerateServices(BeGenerator beGenerator, FeGenerator feGenerator) {
        this.beGenerator = beGenerator;
        this.feGenerator = feGenerator;
    }

//    public byte[] beTemplateGenerate(SourceInfoRequest sourceInfoRequest) throws IOException, SQLException {
//        String filePath = SystemConstants.FILE_PATH + sourceInfoRequest.getArtifactID();
//        String zipFilePath = SystemConstants.FILE_PATH + sourceInfoRequest.getArtifactID() +"-BE" + ".zip";
//        FileUtils.deleteFilesAndFolders(SystemConstants.FE_OUTPUT_FILE_PATH);
//        beGenerator.generateBE(sourceInfoRequest);
//        FileUtils.zipFolder(filePath, zipFilePath);
//        return FileUtils.convertFileToByte(zipFilePath);
//    }
//
//    public byte[] feTemplateGenerate(SourceInfoRequest sourceInfoRequest) throws IOException, SQLException {
//        String filePath = SystemConstants.FE_TEMPLATE_FOLDER_FILE_PATH;
//        String zipFilePath = SystemConstants.FE_OUTPUT_FILE_PATH + "/" + sourceInfoRequest.getArtifactID() +"-FE" + ".zip";
//        FileUtils.deleteFilesAndFolders(SystemConstants.FE_OUTPUT_FILE_PATH);
//        FileUtils.deleteFilesAndFolders(SystemConstants.FE_COMPONENTS_FILE_PATH);
//        feGenerator.generateFe(sourceInfoRequest);
//        FileUtils.zipFolder(filePath, zipFilePath);
//        return FileUtils.convertFileToByte(zipFilePath);
//    }

    public byte[] templateGenerate(SourceInfoRequest sourceInfoRequest) throws IOException, SQLException {
        String filePath = SystemConstants.TEMPLATE_FOLDER_FILE_PATH;
        String zipFilePath = SystemConstants.OUTPUT_FILE_PATH + "/" + sourceInfoRequest.getArtifactID() +"-TEMPLATE" + ".zip";

        FileUtils.deleteFilesAndFolders(SystemConstants.OUTPUT_FILE_PATH);
        FileUtils.deleteFilesAndFolders(SystemConstants.FE_COMPONENTS_FILE_PATH);
        FileUtils.deleteFilesAndFolders(SystemConstants.BE_TEMPLATE_FOLDER_FILE_PATH);

        feGenerator.generateFe(sourceInfoRequest);
        beGenerator.generateBE(sourceInfoRequest);
        FileUtils.zipFolder(filePath, zipFilePath);
        return FileUtils.convertFileToByte(zipFilePath);
    }

}
