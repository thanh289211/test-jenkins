package ${sourceInfo.packageName}.helpers.constants;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SystemConstants {

    public static final int DEFAULT_PAGE_SIZE = 20;
    public static final int DEFAULT_PAGE_NUMBER = 1;

    public static class Date {
        public static final String BASE_DATE_FORMAT = "yyyy-MM-dd";
        public static final String BASE_DATE_FULL_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    }

    public static class File {
        public static final String SUFFIX_XLS = ".xls";
        public static final String SUFFIX_XLSX = ".xlsx";
    }

    public static List<String> ACTION_FEATURE = Arrays.asList("VIEW", "UPDATE", "DELETE", "EXPORT", "ADD", "APPROVE", "IMPORT");

    public static class CONTENT_TYPE_FILE {
        public static final String PNG = "image/png";
        public static final String JPEG = "image/jpeg";
        public static final String JPG = "image/jpg";
        public static final String IMAGE_GIF = "image/gif";
        public static final String PDF = "application/pdf";
        public static final String DOCX = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        public static final String DOC = "application/msword";
        public static final String XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        public static final String XLS = "application/vnd.ms-excel";
        public static final String ZIP_1 = "application/zip";
        public static final String ZIP_2 = "application/x-zip-compressed";
        public static final String RAR = "application/vnd.rar";
    }
}
