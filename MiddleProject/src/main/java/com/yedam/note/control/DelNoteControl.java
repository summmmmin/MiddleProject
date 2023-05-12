package com.yedam.note.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;
import com.yedam.qna.service.QnaService;
import com.yedam.qna.service.QnaServiceImpl;

public class DelNoteControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qid = req.getParameter("noteId");
		NoteService service = new NoteServiceImpl();
		service.delNote(Integer.parseInt(qid));
		
		return "noteList.do";

}
}