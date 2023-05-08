package com.yedam.note.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;


public class NoteListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uId = req.getParameter("userId");
		NoteService service = new NoteServiceImpl();
		List<NoteVO> list = service.noteList(Integer.parseInt(uId));
		req.setAttribute("list", list);
		
		return null;
	}

}
