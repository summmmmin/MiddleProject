package com.yedam.buy.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class BuyDetailControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo"); //로그인된 정보
	    if(user == null) {
	    	return "loginForm.do";
	    }
	    
	    String buyId = req.getParameter("buyId");
		BuyService service = new BuyServiceImpl();
		BuyVO buy = service.getBuyId(Integer.parseInt(buyId));		
		req.setAttribute("buyInfo", buy);
		if(user.getUserId().equals(buy.getUserId()) || user.getUserGrade().equals("관리자")) {
			return "buy/buyDetail.tiles";						
		}else {
			return "loginForm.do";
		}
		
		
	}
}
