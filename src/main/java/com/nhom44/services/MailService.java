
package com.nhom44.services;

import com.nhom44.bean.Cart;
import com.nhom44.mail.MailProperties;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
    private static MailService instance;

    private MailService() {
    }

    public static MailService getInstance() {
        if (instance == null) {
            instance = new MailService();
        }

        return instance;
    }

    private void sendMail(String to, String subject, String content) {
        Properties prop = new Properties();
        prop.setProperty("mail.smtp.host", MailProperties.getMailHost());
        prop.setProperty("mail.smtp.port", MailProperties.getMailPort());
        prop.setProperty("mail.smtp.auth", String.valueOf(MailProperties.getMailAuth()));
        prop.setProperty("mail.smtp.starttls.enable", String.valueOf(MailProperties.getMailStarttls()));
        prop.setProperty("mail.smtp.ssl.trust", MailProperties.sslTrust());
        prop.setProperty("mail.smtp.socketFactory.port", MailProperties.socketFactoryPort());
        prop.setProperty("mail.smtp.socketFactory.class", MailProperties.socketFactoryClass());
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MailProperties.getMailUsername(), MailProperties.getMailPassword());
            }
        };
        Session session = Session.getInstance(prop, auth);
        Message msg = new MimeMessage(session);

        try {
            msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
            msg.setFrom(new InternetAddress(MailProperties.getMailUsername()));
            msg.setRecipients(RecipientType.TO, InternetAddress.parse(to));
            msg.setSubject(subject);
            msg.setText(content);
            msg.setSentDate(new Date());
            Transport.send(msg);
            System.out.println("Sent");
        } catch (Exception var9) {
            var9.printStackTrace();
        }

    }

    public void sendMailToVerify(String domain, String to, String verifycode) {
        if (domain == null) {
            domain = "localhost:8080";
        }
        String verifyLink = "http://" + domain + "/verify?code=" + verifycode;
        String content = "Nhấp vào đường link sau để xác thực tài khoản: " + verifyLink;
        String subject = "Xác thực tài khoản";
        this.sendMail(to, subject, content);
    }

    public void sendMailToAGaig(String domain, String to, String verifycode) {
        if (domain == null) {
            domain = "localhost:8080";
        }
        String verifyLink = "http://" + domain + "/verify?code=" + verifycode;
        String content = "Nhấp vào đường link sau để xác thực tài khoản: " + verifyLink;
        String subject = "Xác thực lại tài khoản";
        this.sendMail(to, subject, content);
    }

    public void sendMailToResetPassword(String to, String password) {
        String content = "Mật khẩu của bạn đã được đổi thành: " + password;
        String subject = "Cấp lại mật khẩu";
        this.sendMail(to, subject, content);
    }

    public void sendMailToNotiFyCart(String domain, String verifycode, Cart cart) {
       if (domain.equals("localhost")) {
            domain += ":8080";
        }
        String content = "Thông tin yêu cầu cuả bạn là :\b" +
                "\n\t\tMã yêu cầu :" + cart.getId() + "\n\t\tLoại hình dự án :" + cart.getCategoryId() +
                "\n\t\tTỉnh thành :" + cart.getProvinceId() + "\n\t\tChiều rộng khu vực xây dựng:" +
                cart.getWidth() + "\n\t\tChiều dài khu vực xây dựng:" + cart.getHeight() + "\n\t\tDự án mẫu :" +
                cart.getRepresentProjectId() + "\n\t\tNgày tạo :" + cart.getCreatedAt();
        String verifyLink = "http://" + domain + "/verify/cart?code=" + verifycode;
        content += "\n\n" + "Nhấp vào đường link sau để xác thực yêu cầu: " + verifyLink;
        String subject = "Xác thực yêu cầu";
        this.sendMail(cart.getEmail(), subject, content);
    }
}
