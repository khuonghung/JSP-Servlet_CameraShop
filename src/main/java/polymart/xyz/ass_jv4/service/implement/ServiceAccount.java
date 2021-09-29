package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOAccount;
import polymart.xyz.ass_jv4.dao.implement.DAOAccount;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceAccount;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.mail.MessagingException;

import static polymart.xyz.ass_jv4.utils.MailUtils.getMailUtils;

public class ServiceAccount implements IServiceAccount {

    private static IDAOAccount _idaoSignup = new DAOAccount();

    @Override
    public String newAccount(EntityStaff signup) {
        String result = _idaoSignup.newAccount(signup);
        if (result.equals(ContaiUtils.REGISTER_TRUE)) {
            EntityStaff entityStaff = _idaoSignup.findByEmail(signup.getEmail());
            if (entityStaff != null) {
                String title = "Kích hoạt tài khoản";
                String body = "<a href=\"http://localhost:8081/ASS_JV4_war_exploded/account?active=" + entityStaff.getId() + "\">Click here</a>";
                try {
                    getMailUtils().sendMail(entityStaff.getEmail(), title, body);
                    return ContaiUtils.REGISTER_TRUE;
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        }
        return ContaiUtils.REGISTER_FALSE;
    }

    @Override
    public EntityStaff findByEmail(String email) {
        return _idaoSignup.findByEmail(email);
    }

    @Override
    public EntityStaff findById(String id) {
        return _idaoSignup.findById(id);
    }

    @Override
    public String newLogin(EntityStaff signin) {
        return _idaoSignup.newLogin(signin);
    }

    @Override
    public boolean activeAccount(String id) {
        return _idaoSignup.activeAccount(id);
    }
}
