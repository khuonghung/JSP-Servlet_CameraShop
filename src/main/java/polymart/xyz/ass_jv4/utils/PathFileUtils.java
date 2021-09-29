package polymart.xyz.ass_jv4.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class PathFileUtils {

    private static PathFileUtils pathFile;

    public final String avatar = "/files/avatar/" + new SimpleDateFormat("yyyyMMdd").format(new Date());

    public final String product = "/files/product/" + new SimpleDateFormat("yyyyMMdd").format(new Date());

    public final String banner = "/files/banner/" + new SimpleDateFormat("yyyyMMdd").format(new Date());

    public static PathFileUtils getPathFile() {
        if (pathFile == null) {
            return pathFile = new PathFileUtils();
        }
        return pathFile;
    }


}
