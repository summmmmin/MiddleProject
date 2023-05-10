package com.yedam.wish.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class wishListControl implements Control{
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("userinfo");

		if (user == null) { // 로그인되어있지 않은 경우
			// session.setAttribute("returnUrl", request.getRequestURI()); // 이전 URL 저장,
			return "user/loginForm.tiles";
		}
		return "wish/wishList.tiles";
	}

}
