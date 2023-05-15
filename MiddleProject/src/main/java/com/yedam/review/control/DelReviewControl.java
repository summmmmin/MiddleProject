package com.yedam.review.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class DelReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rid = req.getParameter("rid");
		ReviewService service = new ReviewServiceImpl();
		service.removeReview(Integer.parseInt(rid));
		
		return "myReview.do";
	}

}
