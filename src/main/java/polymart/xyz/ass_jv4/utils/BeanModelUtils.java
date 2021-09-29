package polymart.xyz.ass_jv4.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BeanModelUtils<T> {

    private static BeanModelUtils beanModel;

    public static BeanModelUtils getBeanModel() {
        if (beanModel == null) {
            return beanModel = new BeanModelUtils();
        }
        return beanModel;
    }

    public String setFileModel(HttpServletRequest request, String nameFile, String path) throws ServletException, IOException {
        Part part = request.getPart(nameFile);
        return saveFile(request, part, path);
    }

    public String saveFile(HttpServletRequest request, Part part, String path) throws IOException {
        File dir = new File(request.getServletContext().getRealPath(path));
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File file = new File(dir, new SimpleDateFormat("HHmmssS").format(new Date()) + part.getSubmittedFileName());
        part.write(file.getAbsolutePath());
        return path + "/" + file.getName();
    }

}
