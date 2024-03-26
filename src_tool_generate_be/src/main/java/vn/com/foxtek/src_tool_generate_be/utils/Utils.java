package vn.com.foxtek.src_tool_generate_be.utils;

import java.sql.Timestamp;
import java.util.Calendar;

public class Utils {
    public static Timestamp createTimestamp() {
        Calendar calendar = Calendar.getInstance();
        return new Timestamp((calendar.getTime()).getTime());
    }
}
