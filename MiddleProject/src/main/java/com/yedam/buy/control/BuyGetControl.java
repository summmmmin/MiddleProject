package com.yedam.buy.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;

public class BuyGetControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String buyId = req.getParameter("buyId");
		
		BuyService service = new BuyServiceImpl();
		BuyVO vo = service.getBuyId(Integer.parseInt(buyId));
		
		String json="{\"buyId\":"+vo.getBuyId()+",";
		json += "\"buyDlvy\":\""+vo.getBuyDlvy()+"\",";
		json += "\"dlvId\":"+vo.getDlvId()+",";
		json += "\"dlvName\":\""+vo.getDlvName()+"\",";
		json += "\"dlvPhone\":\""+vo.getDlvPhone()+"\",";
		json += "\"dlvAddr\":\""+vo.getDlvAddr()+"\",";
		json += "\"dlvNum\":"+vo.getDlvNum()+",";
		json += "\"dlvDate\":\""+vo.getDlvDate()+"\"}";			

		return json+".json";
	}

}
