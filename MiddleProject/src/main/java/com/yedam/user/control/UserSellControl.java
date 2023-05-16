package com.yedam.user.control;

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

public class UserSellControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo");
	    
	    if(user == null) {
	    	return "loginForm.do";
	    }
	    if (!"관리자".equals(user.getUserGrade())) {
	        return "user/accessDenied.tiles"; // 관리자가 아닌 경우 접근 거부 페이지
	    }

		String pageStr = req.getParameter("page");
		String userId = req.getParameter("user_id"); // 입력받은 특정 유저의 아이디
		
		pageStr = pageStr == null? "1":pageStr;
		int page = Integer.parseInt(pageStr);
		
		SellService service = new SellServiceImpl();
		int total = service.sellCount(userId);		
		List<SellVO> list = service.getSellList(userId, page);
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("list", list);
		
		return "user/userSell.tiles";
	}
}
