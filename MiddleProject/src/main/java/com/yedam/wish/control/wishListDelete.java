package com.yedam.wish.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.wish.service.WishService;
import com.yedam.wish.service.WishServiceImpl;

public class wishListDelete implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO) session.getAttribute("userinfo");
		
		System.out.println(userInfo);
		
		if (userInfo == null) {
			return "user/loginForm.tiles";
		}
		
		String wishId = req.getParameter("wishId");
		
		WishService service = new WishServiceImpl();
		service.deletewishList(Integer.parseInt(wishId));
		
		return "wishList.do";
	}

}
