package com.yedam.sell.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;
import com.yedam.user.domain.UserVO;

public class SellDetailControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo"); //로그인된 정보
	    if(user == null) {
	    	return "loginForm.do";
	    }
		String sellId = req.getParameter("sellId");
		
		SellService service = new SellServiceImpl();
		SellVO vo = service.getSellId(Integer.parseInt(sellId));
		req.setAttribute("sellInfo", vo);
		if(user.getUserId().equals(vo.getUserId()) || user.getUserGrade().equals("관리자")) {						
			return "sell/sellDetail.tiles";
		}else {
			return "loginForm.do";
		}
	}

}
