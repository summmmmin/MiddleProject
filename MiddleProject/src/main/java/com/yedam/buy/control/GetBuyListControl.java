package com.yedam.buy.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;
import com.yedam.product.domain.PageDTO;

public class GetBuyListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageStr = req.getParameter("page");
		String data = req.getParameter("data");
		pageStr = pageStr == "" ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		List<String> list1 = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		List<String> list3 = new ArrayList<>();
		
		if (!data.equals("undefined")) {
			JSONObject jsonObject = new JSONObject(data);
			JSONArray jArray = jsonObject.getJSONArray("0");
			JSONArray jArray1 = jsonObject.getJSONArray("1");
			JSONArray jArray2 = jsonObject.getJSONArray("2");

			if (jArray != null) {
				for (int i = 0; i < jArray.length(); i++) {
					list1.add(jArray.getString(i));
				}
			}
			if (jArray1 != null) {
				for (int i = 0; i < jArray1.length(); i++) {
					list2.add(jArray1.getString(i));
				}
			}
			if (jArray2 != null) {
				for (int i = 0; i < jArray2.length(); i++) {
					list3.add(jArray2.getString(i));
				}
			}
		}
		BuyService service = new BuyServiceImpl();		
		int total = service.buyTotalCount(list1,list2,list3);
		List<BuyVO> list = service.BuyList(page,list1,list2,list3);
		PageDTO dto = new PageDTO(page, total);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageInfo", dto);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		return json + ".json";
	}

}
