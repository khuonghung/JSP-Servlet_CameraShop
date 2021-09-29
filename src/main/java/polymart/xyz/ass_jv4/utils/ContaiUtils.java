package polymart.xyz.ass_jv4.utils;

public class ContaiUtils {

    // query update entity
    public static final String UPDATE = "UPDATE";
    public static final String DELETE = "DELETE";
    public static final String INSERT = "INSERT";

    // name query entity
    public static final String FINDALL = "FINDALL";
    public static final String FINDONE = "FINDONE";
    public static final String FINDBYID = "FINBYID";

    // error data
    public static final String ERROR_DATA = "Dữ liệu không hợp lệ";

    // account
    public static final String ACCOUNT_REMOVE = "Tài khoản không tồn tại";
    public static final String ACCOUNT_BLOCK = "Tài khoản đang bị khoá";

    // result
    // register
    public static final String REGISTER_TRUE = "Đăng ký tài khoản thành công";
    public static final String REGISTER_FALSE = "Đăng ký tài khoản không thành công";
    public static final String REGISTER_EMAIL_FALSE = "Email đã đăng ký";
    public static final String REGISTER_PASSWORD_LENGTH_FALSE = "Mật khẩu phải từ 8 đến 50 ký tự";
    public static final String REGISTER_REPASSWORD_FALSE = "Nhập lại mật khẩu không đúng";

    // login
    public static final String LOGIN_TRUE = "Đăng nhập thành công";
    public static final String LOGIN_FALSE = "Email hoặc mật khẩu không chính xác.";
    public static final String ACTIVE_FALSE = "Tài khoản chưa được kích hoạt.";
    public static final String ACTIVE_TRUE = "Tài khoản đã được kích hoạt.";

    public static final String STAFF_ROLE_0 = "Nhân viên bán hàng";
    public static final String STAFF_ROLE_1 = "Nhân viên thu ngân";
    public static final String STAFF_ROLE_2 = "Quản lý cửa hàng";


}
