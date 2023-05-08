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

public class ModifyUser implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("userinfo.userId");
		System.out.println(id);

		String userPw = req.getParameter("userinfo.userPw");
		String userPhone = req.getParameter("userinfo.userPhone");
		String userAdd = req.getParameter("userinfo.userAdd");

		UserService service = UserServiceImpl.getInstance();
		UserVO user = new UserVO();


		user.setUserPw(userPw);
		user.setUserPhone(userPhone);
		user.setUserAdd(userAdd);

		System.out.println(user);

		boolean result = service.modifyUser(user);
		System.out.println(user);

		System.out.println("-----------------------로그 구분용-----------------------------");
		if (result) {
			session.setAttribute("userinfo", user);
			return "mypageView.do";
		} else {
			req.setAttribute("userinfo", user);
			return "user/modifyUserForm.tiles";
		}
	}

}
