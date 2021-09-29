package polymart.xyz.ass_jv4.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

import static java.lang.Thread.sleep;

public class MailUtils {

    private static MailUtils mailUtils;
    private static Thread thread;

    public void sendMailAll(List<String> lstMailTo, String titleMail, String body) throws MessagingException {
        final int[] i = {0};
        thread = new Thread(() -> {
            try {
                for (i[0] = 0; i[0] < lstMailTo.size(); i[0]++) {
                    System.out.println("send mail: " + lstMailTo.get(i[0]));
                    sendMail(lstMailTo.get(i[0]), titleMail, body);
                }
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        });
        thread.start();
    }

    public void sendMail(String emailTo, String titleMail, String body) throws MessagingException {
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        // kết nối session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String username = "thutamxd@gmail.com";
                String password = "thutam123";
                return new PasswordAuthentication(username, password);
            }
        });
        // tạo message
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("thutamxd@gmail.com"));
        mimeMessage.setRecipients(Message.RecipientType.TO, emailTo);
        mimeMessage.setSubject(titleMail, "utf-8");
        mimeMessage.setText(body, "utf-8", "html");
        mimeMessage.setReplyTo(mimeMessage.getFrom());
        // gửi mail
        Transport.send(mimeMessage);
    }

    public static MailUtils getMailUtils() {
        if (mailUtils == null) {
            mailUtils = new MailUtils();
        }
        return mailUtils;
    }
}
