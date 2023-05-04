package com.yedam.sell.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;

public class SellGetControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sellId = req.getParameter("sellId");
		
		SellService service = new SellServiceImpl();
		SellVO vo = service.getSellId(Integer.parseInt(sellId));
		req.setAttribute("sellInfo", vo);
		
		return "sell/sellGet.tiles";
	}

}
