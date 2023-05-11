package com.yedam.buy.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.user.domain.UserVO;

public class BuyListUControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo");
	    if(user == null) {
	    	return "loginForm.do";
	    }
		String pageStr = req.getParameter("page");
		String userId = user.getUserId();
		pageStr = pageStr == null? "1":pageStr;
		int page = Integer.parseInt(pageStr);
		
		BuyService service = new BuyServiceImpl();
		int total = service.buyCount(userId);
		List<BuyVO> list = service.getBuyList(userId, page);
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("pageInfo", dto);
		req.setAttribute("list", list);
		return "buy/buyListU.tiles";
	}

}
