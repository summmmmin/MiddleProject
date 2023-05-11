package com.yedam.wish.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.wish.domain.WishVO;
import com.yedam.wish.service.WishService;
import com.yedam.wish.service.WishServiceImpl;

public class AddwishList implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("userinfo");

		if (user == null) { // 로그인되어있지 않은 경우
			// session.setAttribute("returnUrl", request.getRequestURI()); // 이전 URL 저장,
			// 비회원이 마이페이지를 누르고 로그인했을 때 바로 마이페이지로 이동하게
			return "user/loginForm.tiles";
		}

		String pid = req.getParameter("pid");
		WishVO wish = new WishVO();
		wish.setUserId(user.getUserId());
		wish.setPdtId(Integer.parseInt(pid));

		System.out.println(wish);
		System.out.println(pid);

		WishService service = new WishServiceImpl();
		boolean isSuccess = service.addwishList(wish);

		if (isSuccess) {
			 System.out.println("관심상품 성공등록");
		} else {
			 System.out.println("관심상품 실패");
		}
		return null;
	}
}
