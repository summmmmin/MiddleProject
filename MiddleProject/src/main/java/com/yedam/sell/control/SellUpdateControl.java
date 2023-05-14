package com.yedam.sell.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;

public class SellUpdateControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SellVO vo = new SellVO();
		String sellId = req.getParameter("sellId");
		String dlvy = req.getParameter("dlvy");
		String cancel = req.getParameter("cancel");
		
		vo.setSellId(Integer.parseInt(sellId));
		vo.setSellDlvy(dlvy);
		vo.setSellCancel(cancel);
		
		SellService service = new SellServiceImpl();
		boolean result = false;
		
		String json = "";
		
		Map<String, Object> map = new HashMap<>();
		
		if(cancel != null) {
			result= service.cancelSell(vo);
			
		}
		
		if( dlvy != null) {
			result = service.dlvySell(vo);
			
		}
		
		if(result) {
			vo = service.getSellId(vo.getSellId());
			map.put("retCode", "Success");
			map.put("data", vo);
		}else {
			map.put("retCode","Fail");
		}
			
		Gson gson = new GsonBuilder().create();//gson 객체
		json = gson.toJson(map);
	
		return json + ".json";
	}

}
