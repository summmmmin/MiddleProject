package com.yedam.review.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		String pdtId = req.getParameter("pdtId");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int pdtId2 = Integer.parseInt(pdtId);
		
		ReviewService service = new ReviewServiceImpl();
		int total = service.totalCount(pdtId2);
		List<ReviewVO> list = service.prodReview(pdtId2, page);
		
		PageDTO dto = new PageDTO(page, total);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageInfo", dto);

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		return json + ".json";
	}

}
