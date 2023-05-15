package com.yedam.sell.control;

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
import com.yedam.common.Control;
import com.yedam.product.domain.PageDTO;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;

public class GetSellListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		String data = req.getParameter("data");
		pageStr = pageStr == "" ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		List<String> list1 = new ArrayList<>();
		List<String> list2 = new ArrayList<>();

		if (!data.equals("undefined")) {
			JSONObject jsonObject = new JSONObject(data);
			JSONArray jArray = jsonObject.getJSONArray("0");
			JSONArray jArray1 = jsonObject.getJSONArray("1");

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
		}
		SellService service = new SellServiceImpl();
		int total = service.sellTotalCount(list1,list2);
		List<SellVO> list = service.SellList(page,list1,list2);
		
		PageDTO dto = new PageDTO(page, total);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageInfo", dto);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		return json + ".json";
	}

}
