package com.yedam.review.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class ProdReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ReviewService service = new ReviewServiceImpl();
		List<ReviewVO> list = service.prodReview(page);
		
		PageDTO dto = new PageDTO(page, 10); // 고쳐야함
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		return json + ".json";
	}

}
