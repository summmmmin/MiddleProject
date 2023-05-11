package com.yedam.buy.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;

public class BuyDetailControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String buyId = req.getParameter("buyId");
		BuyService service = new BuyServiceImpl();
		BuyVO buy = service.getBuyId(Integer.parseInt(buyId));
		req.setAttribute("buyInfo", buy);
		System.out.println(buy);
		System.out.println(buyId);
		return "buy/buyDetail.tiles";
	}

}
