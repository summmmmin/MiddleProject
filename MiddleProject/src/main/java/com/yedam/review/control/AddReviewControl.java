package com.yedam.review.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class AddReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDir = req.getServletContext().getRealPath("images");
		int maxSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
		MultipartRequest multi 
				= new MultipartRequest(req, saveDir, maxSize, encoding, rn);
		
		String title = multi.getParameter("title");
		String ct = multi.getParameter("ct");
		String img = multi.getParameter("img");
		
		ReviewVO vo = new ReviewVO();
		vo.setReviewTitle(title);
		vo.setReviewCt(ct);
		vo.setReviewImg(img);
		
		ReviewService service = new ReviewServiceImpl();
		if (service.addReview(vo)) {
			return ""; // 마이페이지 내 리뷰로 가게하기 or 리뷰 쓴 제품 상세 페이지로 가게하기
		} else {
			return "main.do";
		}
	}

}
