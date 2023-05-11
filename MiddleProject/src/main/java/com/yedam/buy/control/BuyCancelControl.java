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

public class BuyCancelControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String buyId = req.getParameter("id");
		String cancel = "취소신청";
		BuyService service = new BuyServiceImpl();
		BuyVO buy = new BuyVO();
		buy.setBuyId(Integer.parseInt(buyId));
		buy.setBuyCancel(cancel);
		boolean result = service.cancelBuy(buy);
		
		String json = "";
		Map<String, Object> map = new HashMap<>();
		
		if(result) {
			buy = service.getBuyId(buy.getBuyId());
			map.put("retCode", "Success");
			map.put("data", buy);
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		json = gson.toJson(map);
		
		return json + ".json";
	}

}
