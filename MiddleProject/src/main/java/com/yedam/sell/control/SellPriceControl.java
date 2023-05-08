package com.yedam.sell.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;

public class SellPriceControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodId = req.getParameter("prodId");
		String size = req.getParameter("size");
		System.out.println(size);
		
		BuyService buyService = new BuyServiceImpl();
		BuyVO buy = new BuyVO();
		buy.setPdtId(Integer.parseInt(prodId));
		buy.setSizeId(Integer.parseInt(size));
		buy = buyService.getBuyPrice(buy);
		
		req.setAttribute("price", buy);
		req.setAttribute("prodId", prodId);
		req.setAttribute("size", size);
		return "sell/sellPrice.tiles";
	}

}
