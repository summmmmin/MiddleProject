package com.yedam.buy.control;

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

public class BuyPriceControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo"); //로그인된 정보
	    if(user == null) {
	    	return "loginForm.do";
	    }
		
		String prodId = req.getParameter("prodId");
		String size = req.getParameter("size");
		
		SellService sellService = new SellServiceImpl();
		SellVO sell = new SellVO();
		sell.setPdtId(Integer.parseInt(prodId));
		sell.setSizeId(Integer.parseInt(size));
		sell = sellService.getSellPrice(sell);
		req.setAttribute("price", sell);
		req.setAttribute("prodId", prodId);
		req.setAttribute("size", size);
		return "buy/buyPrice.tiles";
	}

}
