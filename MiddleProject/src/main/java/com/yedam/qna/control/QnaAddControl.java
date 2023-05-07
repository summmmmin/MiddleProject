package com.yedam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.qna.domain.QnaVO;
import com.yedam.qna.service.QnaService;
import com.yedam.qna.service.QnaServiceImpl;

public class QnaAddControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir =req.getServletContext().getRealPath("images");
		int maxSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
		MultipartRequest multi
		= new MultipartRequest(req,saveDir, maxSize, encoding, rn);
		
		String writer = multi.getParameter("writer");
		String subject = multi.getParameter("subject");
		String title = multi.getParameter("title");
		String attach = multi.getFilesystemName("img");
		String userId = multi.getParameter("userId");
		
		// 사용자의 입력값을 QnaVO 입력.
		QnaVO vo = new QnaVO();
		vo.setPostTitle(title);
		vo.setPostCT(subject);
		vo.setUserNm(writer);
		vo.setQnaImg(attach);;
		vo.setUserId(userId);
		
		System.out.println(vo);
		
		QnaService service = new QnaServiceImpl();
		if(service.addQna(vo)) {
			return "qnaList.do"; 
		}
			return "main.do";
	}
}
