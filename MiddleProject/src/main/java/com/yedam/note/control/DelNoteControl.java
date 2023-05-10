package com.yedam.note.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;

public class DelNoteControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nid = req.getParameter("noteId");
		NoteService service = new NoteServiceImpl();
		String json = "";
		
		if(service.delNote(Integer.parseInt(nid))){
			json = "{\"retCode\":\"Success\"}";
			
		}else {
			json = "{\"retCode\":\"Fail\"}";
		}
		return json + ".json";
	}

}
