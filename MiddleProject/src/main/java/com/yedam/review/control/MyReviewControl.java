package com.yedam.review.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.product.domain.ProdVO;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;
import com.yedam.user.domain.UserVO;

public class MyReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO) session.getAttribute("userinfo");
		ProdVO prodInfo = (ProdVO) session.getAttribute("prodInfo");
		String userId = userInfo.getUserId();
		int prodId = prodInfo.getPdtId();
		
		System.out.println(userId);
		String pageStr = req.getParameter("page");
		System.out.println(pageStr);
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ReviewService service = new ReviewServiceImpl();
		int total = service.getMyReviewCount(userId, prodId);
		PageDTO dto = new PageDTO(page, total);
		List<ReviewVO> list = service.myReview(userId, page);
		req.setAttribute("myReview", list);
		req.setAttribute("pageInfo", dto);
		
		return "review/myReviewList.tiles";
	}

}
