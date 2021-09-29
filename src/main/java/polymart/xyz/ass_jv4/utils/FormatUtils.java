package polymart.xyz.ass_jv4.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatUtils {

    private static FormatUtils formatUtils;

    private static final String dateFormater = "yyyy-MM-dd";

    public String dateToString(Date date) {
        return new SimpleDateFormat(dateFormater).format(date);
    }

    public Date stringToDate(String date) {
        try {
            return new SimpleDateFormat(dateFormater).parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkDate(Date date1, Date date2) {
        String x = new SimpleDateFormat("yyyyMMdd").format(date1);
        String y = new SimpleDateFormat("yyyyMMdd").format(date2);
        int z = Integer.parseInt(x) - Integer.parseInt(y);
        return z >= 0;
    }

    public static FormatUtils getFormatUtils() {
        if (formatUtils == null) {
            formatUtils = new FormatUtils();
        }
        return formatUtils;
    }

}
