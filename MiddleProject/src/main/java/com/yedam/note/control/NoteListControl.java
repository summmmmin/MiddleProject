package com.yedam.note.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.service.NoteService;
import com.yedam.note.service.NoteServiceImpl;
import com.yedam.user.domain.UserVO;


public class NoteListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		// 세션 아이디 정보 가져오기
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO) session.getAttribute("userinfo");
		String id = userInfo.getUserId(); 
		
		
		NoteService service = new NoteServiceImpl();
		int read = service.readCount(id);
		
		String pageStr = req.getParameter("page");	
		pageStr = pageStr ==null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int total = service.myNoteCount(id); // 쪽지의 총 갯수
		PageDTO dto = new PageDTO(page,total);
		List<NoteVO> list = service.noteList(id,page);
		req.setAttribute("noteList", list);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("readInfo", read);
		
		return "note/noteList.tiles";
	}
}


