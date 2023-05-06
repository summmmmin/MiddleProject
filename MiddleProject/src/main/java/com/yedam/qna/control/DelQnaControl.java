package com.yedam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.qna.service.QnaService;
import com.yedam.qna.service.QnaServiceImpl;

public class DelQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qid = req.getParameter("postId");
		QnaService service = new QnaServiceImpl();
		service.delQna(Integer.parseInt(qid));
		
		return "qnaList.do";
	}
	}
