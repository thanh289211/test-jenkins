package ${sourceInfo.packageName}.helpers.utils;

import lombok.extern.slf4j.Slf4j;
import java.sql.Timestamp;
import java.util.Calendar;

@Slf4j
public class Utils {
    public static Timestamp createTimestamp() {
        Calendar calendar = Calendar.getInstance();
        return new Timestamp((calendar.getTime()).getTime());
    }

    public static <E> E nvl(E expr1, E expr2) {
        return (null != expr1) ? expr1 : expr2;
    }
}