package com.yedam.user.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;

public class ModifyUserControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		System.out.println(id);
		System.out.println(name);

		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");

		UserService service = UsersServiceImpl.getInstance();
		UserVO vo = new UserVO();

		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println(vo);
		

		if (vo != null) {
			vo.setUserPw(password);
			vo.setUserPh(phone);
			vo.setUserAddr(address);

			boolean result = service.modifyUser(vo);
			System.out.println(vo);

			System.out.println("-----------------------로그 구분용-----------------------------");
			if (result) {
				session.setAttribute("users", vo);
				return "main.do";
			} else {
				req.setAttribute("users", vo);
				return "user/modifyUser.tiles";
			}
		} else {
			return "user/modifyUser.tiles";
		}
	}

}
