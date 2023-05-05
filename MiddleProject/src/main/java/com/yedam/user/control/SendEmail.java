package com.yedam.user.control;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class SendEmail {
	public static void sendEmail(String recipient, String subject, String content, String authNum)
			throws MessagingException {
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
		message.setText("인증번호는 " + authNum + "입니다.");

		// 이메일을 보냅니다.
		Transport.send(message);
	}

	public static String generateAuthNum() {
		Random random = new Random();
		int num = random.nextInt(100000);
		return String.format("%05d", num);
	}
}
