package com.yedam.note.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;
import com.yedam.user.domain.UserVO;

public class DelAllNoteControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO) session.getAttribute("userinfo");
		String id = userInfo.getUserId();
		NoteService service = new NoteServiceImpl();
		String json="";
		if(service.delAllNote(id)) {
			json = "{\"retCode\":\"Success\"}";
			
		}else {
			json = "{\"retCode\":\"Fail\"}";
		}
		return json + ".json";
	}

}
