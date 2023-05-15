package com.yedam.sell.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
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
		
		SellService service = new SellServiceImpl();
		vo = service.getSellId(Integer.parseInt(sellId));
		
		vo.setSellDlvy(dlvy);
		vo.setSellCancel(cancel);

		boolean result = false;
		BuyService buyservice = new BuyServiceImpl();
		String json = "";
		BuyVO buy = new BuyVO();
		buy.setBuyId(vo.getBuyId());
		buy.setBuyCancel(cancel);
		buy.setBuyDlvy(dlvy);
		System.out.println(buy);
		System.out.println(dlvy);
		System.out.println("검수합격".equals(dlvy));
		System.out.println(dlvy.equals("검수합격"));
		Map<String, Object> map = new HashMap<>();
		
		if(cancel != null) {
			if(cancel.equals("취소완료")) {
				boolean test= buyservice.cancelBuy(buy);
				System.out.println(test);
			}
			result= service.cancelSell(vo);
			
		}
		
		if( dlvy != null) {
			if(dlvy.equals("입고완료")|| dlvy.equals("검수중") || dlvy.equals("검수합격")|| dlvy.equals("검수불합격")|| dlvy.equals("거래실패")) {
				boolean test1=buyservice.deliveBuy(buy);
				System.out.println(test1);
			}
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
