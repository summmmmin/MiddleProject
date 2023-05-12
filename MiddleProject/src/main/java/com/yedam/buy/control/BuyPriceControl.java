package com.yedam.buy.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;

public class BuyPriceControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
