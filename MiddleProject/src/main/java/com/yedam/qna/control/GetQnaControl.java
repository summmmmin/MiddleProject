package com.yedam.qna.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.domain.QnaVO;
import com.yedam.qna.service.QCommentService;
import com.yedam.qna.service.QCommentServiceImpl;
import com.yedam.qna.service.QnaService;
import com.yedam.qna.service.QnaServiceImpl;

public class GetQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qid = req.getParameter("postId");
		String page = req.getParameter("page");
		System.out.println(qid);
		QnaService service = new QnaServiceImpl();
		QnaVO vo = service.getQna(Integer.parseInt(qid));
		QCommentService service2 = new QCommentServiceImpl();
		QCommentVO vo2 = service2.getComment(Integer.parseInt(qid));
		
		System.out.println(vo);
		req.setAttribute("qnaInfo", vo);
		req.setAttribute("pageNum", page);
		req.setAttribute("commentInfo", vo2);
		try {
			if(vo.getQnaImg() != null) {
				String imgPath =  req.getServletContext().getRealPath("images");
				Path file = Paths.get(imgPath + "/" + vo.getQnaImg());
				System.out.println(Files.probeContentType(file));
				// image/jpg, image/png, text/plain
				String fileType = Files.probeContentType(file);
				req.setAttribute("fileType", fileType.substring(0,fileType.indexOf("/")));
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "qna/getQna.tiles";
		
	}

}
