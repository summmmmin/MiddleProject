package com.yedam.wish.control;

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
		
		System.out.println(userInfo);
		
		if (userInfo == null) {
			return "user/loginForm.tiles";
		}

		String userId = userInfo.getUserId();
		System.out.println(userId);

		WishService service = new WishServiceImpl();
		List<WishVO> list = service.wishList(userId);
		
		System.out.println(" 해당 유저의 관심상품은 > " + list);
		
        // 관심상품이 비어있을 경우 메시지를 설정
        if (list.isEmpty()) {
            req.setAttribute("isEmpty", true);
        } else {
            req.setAttribute("wishlist", list);
        }

		return "wish/wishList.tiles";
	}

}

