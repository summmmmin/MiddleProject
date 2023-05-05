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
		String pageInfo = "main.do";
		
		if(req.getMethod().equals("GET")) {
			pageInfo = "qna/qnaAdd.tiles";
		}else {
		
		
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
		
		// 사용자의 입력값을 NoticeVO 입력.
		QnaVO vo = new QnaVO();
		vo.setPostTitle(title);
		vo.setPostCT(subject);
		vo.setUserNM(writer);
		vo.setPostImg(attach);;
		
		QnaService service = new QnaServiceImpl();
		if(service.addQna(vo)) {
			return "qna/qnalist.tiles"; 
		}
			return pageInfo;
		}
		return pageInfo;
}
}
