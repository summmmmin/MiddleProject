package com.yedam.note.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;
import com.yedam.user.domain.UserVO;


public class NoteListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO) session.getAttribute("userinfo");
		String id = userInfo.getUserId();
		System.out.println(id);
		NoteService service = new NoteServiceImpl();
		System.out.println(id);
		String json = "";
		List<NoteVO> list = service.noteList(id);		
		for(int i = 0 ; i<list.size();i++) {
			json +="{\"userId\":"+list.get(i).getUserId() + ",";
			json += "\"noteId\":\"" + list.get(i).getNoteId() + "\",";
			json += "\"noteCT\":" + list.get(i).getNoteCT() +",";
			json += "\"noteDate\":" + list.get(i).getNoteDate()  + ",";
			json += "\"noteView\" :\"" + list.get(i).getNoteView() + "\"}";
		
			if(i+1 != list.size()) {
				json += ",";
			}
		}
		json +="";
		System.out.println(json);
		return json + ".json";
	}
}

