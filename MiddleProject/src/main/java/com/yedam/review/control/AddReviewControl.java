package com.yedam.review.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.service.ReviewService;
import com.yedam.review.service.ReviewServiceImpl;

public class AddReviewControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String bid = req.getParameter("bid");
		if (req.getMethod().equals("GET")) {

			BuyService buyservice = new BuyServiceImpl();
			BuyVO buy = buyservice.getBuyId(Integer.parseInt(bid));
			req.setAttribute("buyInfo", buy);

			return "review/addReview.tiles";
		} else if (req.getMethod().equals("POST")) {

			String saveDir = req.getServletContext().getRealPath("images");
			int maxSize = 5 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
			MultipartRequest multi = new MultipartRequest(req, saveDir, maxSize, encoding, rn);

			String title = multi.getParameter("title");
			String ct = multi.getParameter("ct");
			String img = multi.getFilesystemName("img");
			System.out.println(ct);
			ReviewVO vo = new ReviewVO();
			vo.setReviewTitle(title);
			vo.setReviewCt(ct);
			vo.setReviewImg(img);
			vo.setBuyId(Integer.parseInt(bid));
			System.out.println(vo);
			ReviewService service = new ReviewServiceImpl();
			if (service.addReview(vo)) {
				return "myReview.do";
			}
		}
		return "main.do";
	}
}