package com.yedam.user.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

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

		UserService service = UserServiceImpl.getInstance();
		UserVO vo = new UserVO();

		UserVO vo = (UserVO) session.getAttribute("member");
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
				return "noticeList.do";
			} else {
				req.setAttribute("users", vo);
				return "users/modifyUsers.tiles";
			}
		} else {
			return "users/modifyMember.tiles";
		}
	}

}
