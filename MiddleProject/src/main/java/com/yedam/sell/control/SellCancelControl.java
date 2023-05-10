package com.yedam.sell.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;

public class SellCancelControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//취소신청
		String sellId = req.getParameter("id");
		String cancel = "취소신청";
		SellService service = new SellServiceImpl();
		SellVO sell = new SellVO();
		sell.setSellId(Integer.parseInt(sellId));
		sell.setSellCancel(cancel);
		service.cancelSell(sell);
		
		return "sellListU.do";
	}

}
