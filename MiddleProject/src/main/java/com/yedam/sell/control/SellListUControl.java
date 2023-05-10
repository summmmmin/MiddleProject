package com.yedam.sell.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;
import com.yedam.user.domain.UserVO;

public class SellListUControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo");
	    if(user == null) {
	    	return "loginForm.do";
	    }
		String pageStr = req.getParameter("page");
		String userId = user.getUserId();
		System.out.println(userId);
		pageStr = pageStr == null? "1":pageStr;
		int page = Integer.parseInt(pageStr);
		
		SellService service = new SellServiceImpl();
		int total = service.sellCount(userId);		List<SellVO> list = service.getSellList(userId, page);
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("list", list);
		System.out.println(total);
		return "sell/sellListU.tiles";
	}

}
