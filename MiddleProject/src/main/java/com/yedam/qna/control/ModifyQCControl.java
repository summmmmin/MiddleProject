package com.yedam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.service.QCommentService;
import com.yedam.qna.service.QCommentServiceImpl;

public class ModifyQCControl implements Control {

	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QCommentService service = new QCommentServiceImpl();

		if (req.getMethod().equals("POST")) {
			String qid = req.getParameter("postId");	
			String subject = req.getParameter("subject");
			QCommentVO vo = new QCommentVO();
			vo.setPostId(Integer.parseInt(qid));
			vo.setCommentCT(subject);
			service.modifyQcomment(vo);
		}
		return "qnaList.do";	
	}

}