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

public class DeleteUserControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		String userPw = (String) session.getAttribute("userPw");

		UserVO user = new UserVO();
		user.setUserId(userId);
		user.setUserPw(userPw);

		UserService userService = UserServiceImpl.getInstance();
		boolean result = userService.deleteUser(user);

		if (result) {
			session.invalidate();
			
			return "user/main.tiles";
		}
		return "user/deleteUser.tiles";
	}
}