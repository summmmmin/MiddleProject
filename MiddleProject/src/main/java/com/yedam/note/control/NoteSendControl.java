package com.yedam.note.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;

public class NoteSendControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("userId");
		String subject = req.getParameter("noteCT");
		
		// 사용자의 입력값을 QnaVO 입력.
		NoteVO vo = new NoteVO();
		vo.setNoteCT(subject);
		vo.setUserId(uid);
		
		System.out.println(vo);
		
		NoteService service = new NoteServiceImpl();
		if(service.sendNote(vo)) {
			return "noteList.do"; 
		}else {
			return "main.do";
	}

	}

}
