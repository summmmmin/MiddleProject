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

public class ModifyAccControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sellId = req.getParameter("sellId");
		String sellAcc = req.getParameter("sellAcc");
		SellVO vo = new SellVO();
		vo.setSellId(Integer.parseInt(sellId));
		vo.setSellAccount(sellAcc);
		SellService service = new SellServiceImpl();
		boolean result = service.modifyAcct(vo);
		System.out.println(result);
		String json = "";
		Map<String, Object> map = new HashMap<>();
		vo= service.getSellId(vo.getSellId());
		String str = vo.getSellAccount();
		String[] array = str.split("/");
		vo.setSellAccountNm(array[0]);
		vo.setSellAccount(array[1]);
		if(result) {
			System.out.println(vo);
			map.put("retCode", "Success");
			map.put("data", vo);
			
		}else {
			map.put("retCode", "Fail");
		}
		
		Gson gson = new GsonBuilder().create();  //gson 객체
		json = gson.toJson(map);
		return json + ".json";
	}

}
