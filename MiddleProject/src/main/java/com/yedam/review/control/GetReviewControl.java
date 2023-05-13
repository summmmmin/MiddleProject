package com.yedam.review.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class GetReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String rid = req.getParameter("rid");
		
		ReviewService service = new ReviewServiceImpl();
		ReviewVO vo = service.searchReview(Integer.parseInt(rid));
		
		req.setAttribute("reviewInfo", vo);
		
		try {
			if (vo.getReviewImg() != null) {
				String imgPath = req.getServletContext().getRealPath("images");
				Path file = Paths.get(imgPath + "/" + vo.getReviewImg());
				System.out.println(Files.probeContentType(file));
				String fileType = Files.probeContentType(file);
				req.setAttribute("fileType", fileType.substring(0, fileType.indexOf("/")));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "review/getReview.tiles";
	}

}
