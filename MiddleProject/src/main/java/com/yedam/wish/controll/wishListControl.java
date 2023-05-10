package com.yedam.wish.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.wish.domain.WishVO;
import com.yedam.wish.service.WishService;
import com.yedam.wish.service.WishServiceImpl;

public class wishListControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO) session.getAttribute("userinfo");

		if (userInfo == null) {
			return "user/loginForm.tiles";
		}

		String userId = userInfo.getUserId();
		resp.setContentType("application/json;charset=utf-8");

		WishService service = new WishServiceImpl();
		String json = "[";
		List<WishVO> list = service.wishList(userId);

		req.setAttribute("wishlist", list);

		return "wish/wishList.tiles";
	}

}
