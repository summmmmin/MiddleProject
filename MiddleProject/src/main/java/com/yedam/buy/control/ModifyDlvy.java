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

public class ModifyDlvy implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// set dlv_name=#{dlvName}, dlv_phone=#{dlvPhone}, dlv_addr=#{dlvAddr}, dlv_num=#{dlvNum} where dlv_id=#{dlvId}
		String dlvName = req.getParameter("dlvName");
		String dlvPhone = req.getParameter("dlvPhone");
		String dlvAddr = req.getParameter("dlvAddr");
		String dlvNum = req.getParameter("dlvNum");
		String dlvId = req.getParameter("dlvId");
		String bid = req.getParameter("bid");
		BuyVO vo = new BuyVO();
		vo.setDlvName(dlvName);
		vo.setDlvPhone(dlvPhone);
		vo.setDlvAddr(dlvAddr);
		vo.setDlvNum(Integer.parseInt(dlvNum));
		vo.setDlvId(Integer.parseInt(dlvId));
		vo.setBuyId(Integer.parseInt(bid));
		
		BuyService service = new BuyServiceImpl();
		boolean result = service.modifyDlvy(vo);
		
		String json = "";
		Map<String, Object> map = new HashMap<>();
		
		if(result) {
			vo= service.getBuyId(vo.getBuyId());	
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
