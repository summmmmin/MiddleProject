package com.yedam.user.control;


import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    public static void sendEmail(String recipient, String subject, String content, String activationLink) throws MessagingException {
        // SMTP 서버와 연결에 필요한 정보를 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Gmail 계정 정보
        String username = "qomo596@gmail.com"; // 보내는 사람의 Gmail 계정
        String password = "ddlgznoxtmfefivt"; // 보내는 사람의 Gmail 계정 비밀번호

        // Session 객체를 생성
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        // Message 객체를 생성
        Message message = new MimeMessage(session);

        // 보내는 사람, 받는 사람, 제목, 내용을 설정
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject(subject);
        message.setContent(content + "<br><br>계정 활성화를 위해서 다음 링크를 클릭해주세요:<br><a href='" + activationLink + "'>활성화 링크</a>", "text/html");

        // 이메일을 보냅니다.
        Transport.send(message);
    }

    public static String generateActivationLink(String email) {
        String uniqueValue = UUID.randomUUID().toString(); // 랜덤한 유니크 값 생성
        String activationLink = "http://localhost:8081/activate?email=" + email + "&key=" + uniqueValue;
        return activationLink;
    }
}