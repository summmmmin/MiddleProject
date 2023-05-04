package com.yedam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.qna.domain.QnaVO;
import com.yedam.qna.service.QnaService;
import com.yedam.qna.service.QnaServiceImpl;

public class GetQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qid = req.getParameter("postId");
		String page = req.getParameter("page");
		
		QnaService service = new QnaServiceImpl();
		QnaVO vo = service.getQna(Integer.parseInt(qid));
		System.out.println(vo);
		req.setAttribute("qnaInfo", vo);
		req.setAttribute("pageNum", page);
		
		return "qna/getQna.tiles";
		
	}

}
