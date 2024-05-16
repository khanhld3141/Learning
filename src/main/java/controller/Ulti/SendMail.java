package controller.Ulti;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Properties;

public class SendMail {
    //nnam23032004@gmail.com
    //odjs tjbh ypgi zxss

    public static void Send(String email, String name, String username, String pass) {
        final String from = "nnam23032004@gmail.com";
        final String to = email;
        final String password = "odjstjbhypgizxss";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        //create Authentication
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }


        };

        //phien lam viec
        Session session = Session.getInstance(props, auth);

        //gui email
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-Type", "text/HTML;charset=UTF-8");
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject("Confirm email");
            msg.setSentDate(new Date());
            msg.setReplyTo(null);
            String text = "Confirm email to register in E-Learning";
            text += "We received a register from you with username: " + username + ". If your confirm, then click to " +
                    "blow link:";
            String encodedName = URLEncoder.encode(name, "UTF-8");
            text += "http://localhost:8080/confirm-email?username=" + username + "&email=" + email + "&password=" + pass + "&name=" + encodedName;
            msg.setText(text);

            Transport.send(msg);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

}

