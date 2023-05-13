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
		String str = vo.getSellAccount();
		String[] array = str.split("/");
		String json="";
		json += "{\"sellId\":"+vo.getSellId()+",";
		json += "\"userId\":\""+vo.getUserId()+"\",";
		json += "\"buyId\":"+vo.getBuyId()+",";
		json += "\"sellDate\":\""+vo.getSellDate()+"\",";
		json += "\"sellPrice\":"+vo.getSellPrice()+",";
		json += "\"sellDlvy\":\""+vo.getSellDlvy()+"\",";
		json += "\"sellCancel\":\""+vo.getSellCancel()+"\",";
		json += "\"sellAccountNm\":\""+array[0]+"\",";
		json += "\"sellAccount\":\""+array[1]+"\",";
		json += "\"pdtNm\":\""+vo.getPdtNm()+"\",";
		json += "\"pdtImg\":\""+vo.getPdtImg()+"\",";
		json += "\"sizeSize\":\""+vo.getSizeSize()+"\",";
		json += "\"brdNm\":\""+vo.getBrdNm()+"\",";
		json += "\"dlvId\":"+vo.getDlvId()+",";
		json += "\"dlvName\":\""+vo.getDlvName()+"\",";
		json += "\"dlvPhone\":\""+vo.getDlvphone()+"\",";
		json += "\"dlvAddr\":\""+vo.getDlvAddr()+"\",";
		json += "\"dlvNum\":"+vo.getDlvNum()+",";
		json += "\"dlvDate\":\""+vo.getDlvDate()+"\"}";	
		System.out.println(json);
		return json+".json";
		

		
	}

}
