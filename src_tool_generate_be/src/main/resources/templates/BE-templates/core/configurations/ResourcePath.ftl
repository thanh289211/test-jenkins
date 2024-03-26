package ${sourceInfo.packageName}.core.configurations;

public class ResourcePath {
public static final String FIX = "/**";
public static final String VERSION = "/v1";
public static final String BASE = ResourcePath.VERSION;
public static final String TEST = "/test" + ResourcePath.VERSION;

public static final String[] NON_LOGGING_URL_LIST = {
BASE + "/auth/login",
BASE + "/auth/cms-login",
BASE + "/auth/change-password",
};
}