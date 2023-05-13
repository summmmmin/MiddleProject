package com.yedam.note.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;

public class SendAllControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subject = req.getParameter("subject");
		System.out.println(subject);
		
		NoteService service = new NoteServiceImpl();
		if(service.sendAll(subject)) {
			System.out.println("성공");
			return "main.do"; 
		}else {
			return "main.do";
	}

	}

}

