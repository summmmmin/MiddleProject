package com.yedam.qna.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.qna.domain.QnaVO;
import com.yedam.qna.service.QnaService;
import com.yedam.qna.service.QnaServiceImpl;
import com.yedam.user.domain.UserVO;

public class MyQnaControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserVO userInfo = (UserVO) session.getAttribute("userinfo");
		String id = userInfo.getUserId();
		
		System.out.println(id);
		String pageStr = req.getParameter("page");
		System.out.println(pageStr);
		pageStr = pageStr ==null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		System.out.println(id);
		QnaService service = new QnaServiceImpl();
		int total = service.myQnaCount(id);
		System.out.println(total);
		PageDTO dto = new PageDTO(page,total);
		List<QnaVO> list = service.myqnaList(id,page);
		System.out.println(list);
		req.setAttribute("myQna", list);
		req.setAttribute("pageInfo", dto);
		
		
		return "qna/myQnaList.tiles";
	}

}
