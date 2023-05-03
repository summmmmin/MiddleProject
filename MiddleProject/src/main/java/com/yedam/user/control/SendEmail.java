package com.yedam.user.control;


import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	public static void gmailSend() {
        String user = "qomo596@gmail.com"; // gmail 계정
        String password = "ddlgznoxtmfefivt";   // gmail 패스워드(2단계 앱보안 비밀번호)

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("gceyuna@gmail.com")); 

            // Subject
            message.setSubject("JAVA메일 테스트"); //메일 제목을 입력

            // Text
            message.setText("JAVA로 전송한 이메일입니다");    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("메일 전송 성공");
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

	public static void main(String[] args) {
		SendEmail.gmailSend();
	}

}