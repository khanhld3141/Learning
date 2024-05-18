package controller.Admin.LoginController;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class SendCode {
    //nnam23032004@gmail.com
    //odjs tjbh ypgi zxss

    public static int Send(String email) {
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
            String text = "Forgot password?";
            Random rd = new Random();
            int code = rd.nextInt(900000) + 100000;
            text += "Your code to verify your password: "+Integer.toString(code);

            msg.setText(text);

            Transport.send(msg);
            return code;
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}

