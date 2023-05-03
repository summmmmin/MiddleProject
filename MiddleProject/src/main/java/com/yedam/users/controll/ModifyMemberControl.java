package com.yedam.users.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class ModifyMemberControl implements Control {

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

		MemberService service = MemberServiceImpl.getInstance();
		MemberVO vo = new MemberVO();

		//MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println(vo);
		

		if (vo != null) {
			vo.setPassword(password);
			vo.setPhone(phone);
			vo.setAddress(address);

			boolean result = service.modifyMember(vo);
			System.out.println(vo);

			System.out.println("-----------------------로그 구분용-----------------------------");
			if (result) {
				session.setAttribute("member", vo);
				return "noticeList.do";
			} else {
				req.setAttribute("member", vo);
				return "member/modifyMember.tiles";
			}
		} else {
			return "member/modifyMember.tiles";
		}
	}

}
