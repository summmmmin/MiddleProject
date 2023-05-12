package com.yedam.user.control;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class FindPasswordControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = req.getParameter("user_id");
		UserService service = new UserServiceImpl();

		if (service.getUserInfo(userId) != null) {
			String userId2 = userId;
			String newPassword = generatePw(); // Generate a new password
			service.findPassword(userId2, newPassword);
			sendEmail(userId2, newPassword); // Call the sendEmail method
			req.setAttribute("message", "비밀번호가 이메일로 전송되었습니다.");
		} else {
			req.setAttribute("message", "올바른 이메일 형식이 아니거나 존재하지 않는 아이디입니다.");
		}

		return "user/loginForm.tiles";
	}

	private String generatePw() {
		// 4~6 글자의 알파벳 + 숫자 랜덤값 생성
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		int passwordLength = random.nextInt(3) + 4; // 4~6 글자
		for (int i = 0; i < passwordLength; i++) {
			int index = random.nextInt(characters.length());
			sb.append(characters.charAt(index));
		}
		return sb.toString();	
	}

	private void sendEmail(String userId, String newPassword) {
		System.out.println("비밀번호가 이메일로 전송되었습니다.");
		System.out.println("회원이메일: " + userId);
		System.out.println("새로운 비밀번호: " + newPassword);
	}
}
