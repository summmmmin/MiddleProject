package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class DeleteUserFormControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("userinfo");

		if (user == null) { // 로그인되어있지 않은 경우
							// session.setAttribute("returnUrl", request.getRequestURI()); // 이전 URL 저장,
							// 비회원이 마이페이지를 누르고 로그인했을 때 바로 마이페이지로 이동하게
			return "user/loginForm.tiles";
		}

		// 비밀번호 검증
		String inputPw = req.getParameter("user_pw");

		System.out.println("user_pw " + inputPw);
		System.out.println(user.getUserPw());
		if (inputPw != null && inputPw.equals(user.getUserPw())) {
			return "deleteUser.do";
		} else {
			req.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			return "user/deleteUserForm.tiles";
		}
	}
}