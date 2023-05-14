package com.yedam.buy.control;

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


public class BuyUpdateControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BuyVO vo = new BuyVO();
		String cancel = req.getParameter("cancel");
		String dlvy = req.getParameter("dlvy");
		String buyreturn = req.getParameter("return");
		
		vo.setBuyId(Integer.parseInt(req.getParameter(("buyId"))));
		vo.setBuyCancel(req.getParameter("cancel"));
		vo.setBuyDlvy(req.getParameter("dlvy"));
		vo.setBuyReturn(req.getParameter("return"));

		BuyService service = new BuyServiceImpl();
		
		boolean result= service.cancelBuy(vo);
		
		
		String json = "";
		
		Map<String, Object> map = new HashMap<>();
		
		if(cancel != null) {
			result= service.cancelBuy(vo);
			
		}
		
		if( dlvy != null) {
			result = service.deliveBuy(vo);
			
		}
		
		if( buyreturn != null) {
			result = service.returnBuy(vo);
		}
		
		if(result) {
			vo = service.getBuyId(vo.getBuyId());
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
