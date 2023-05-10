package com.yedam.qna.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.domain.QnaVO;
import com.yedam.qna.service.QCommentService;
import com.yedam.qna.service.QCommentServiceImpl;

public class ModifyQCControl implements Control {

	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		QnaVO qnaInfo = (QnaVO) session.getAttribute("qnainfo");
		int id = qnaInfo.getPostId();
		QCommentVO vo = new QCommentVO();
		
		vo.setPostId(id);
		vo.setPostId(Integer.parseInt(req.getParameter("subject2")));
		
		QCommentService service = new QCommentServiceImpl();
		System.out.println(vo);
		boolean result= service.modifyQcomment(vo);
		System.out.println(result);
		// search.
		String json = "";
		
		Map<String, Object> map = new HashMap<>();
		
		if(result) {
			return "getQna.do?postId="+id;
		}else {
			return "main.do";
		}


	}

}
