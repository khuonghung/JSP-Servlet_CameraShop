package polymart.xyz.ass_jv4.utils;

public class ValidateUtils {

    private static ValidateUtils validate;

    public static ValidateUtils getValidate() {
        if (validate == null) {
            return validate = new ValidateUtils();
        }
        return validate;
    }

}
