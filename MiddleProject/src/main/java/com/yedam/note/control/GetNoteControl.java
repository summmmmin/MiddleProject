package com.yedam.note.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.service.QCommentService;
import com.yedam.qna.service.QCommentServiceImpl;

public class GetNoteControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qid = req.getParameter("noteId");
		String page = req.getParameter("page");
		NoteService service = new NoteServiceImpl();
		NoteVO vo = service.getNote(Integer.parseInt(qid));


		req.setAttribute("noteInfo", vo);
		req.setAttribute("pageNum", page);

		
		return "note/getNote.tiles";
		
	}
}