package vn.com.foxtek.src_tool_generate_be.utils;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Component;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class FileUtils {

    public static void deleteFilesAndFolders(String folderPath) throws IOException {
        File folder = new File(folderPath);
        org.apache.tomcat.util.http.fileupload.FileUtils.cleanDirectory(folder);
    }

    public static byte[] convertFileToByte(String filePath) throws IOException {
        File file = new File(filePath);
        return Files.readAllBytes(file.toPath());
    }

    public static void zipFolder(String sourceFolderPath, String zipFilePath) throws IOException {
        File sourceFolder = new File(sourceFolderPath);
        try (FileOutputStream fos = new FileOutputStream(zipFilePath);
             ZipOutputStream zos = new ZipOutputStream(fos)) {
            addToZip(sourceFolder, sourceFolder.getName(), zos);
        }
    }

    public static String getNameIgnoreType(String fileName){
        int lastDotIndex = fileName.lastIndexOf('.');

        String fileNameIgnoreType = "";

        if (lastDotIndex > 0) {
            fileNameIgnoreType = fileName.substring(0, lastDotIndex);
        }
        return fileNameIgnoreType;
    }

    private static void addToZip(File file, String entryName, ZipOutputStream zos) throws IOException {
        if (file.isDirectory()) {
            for (File innerFile : file.listFiles()) {
                addToZip(innerFile, entryName + "/" + innerFile.getName(), zos);
            }
        } else {
            byte[] buffer = new byte[1024];
            try (FileInputStream fis = new FileInputStream(file)) {
                zos.putNextEntry(new ZipEntry(entryName));
                int length;
                while ((length = fis.read(buffer)) > 0) {
                    zos.write(buffer, 0, length);
                }
                zos.closeEntry();
            }
        }
    }
}
