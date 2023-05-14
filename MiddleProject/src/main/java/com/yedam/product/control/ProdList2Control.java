package com.yedam.product.control;

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
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class ProdList2Control implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pageStr = req.getParameter("page");
		String data = req.getParameter("data");
		pageStr = pageStr == "" ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		List<String> list1 = new ArrayList<>();
		List<Integer> list2 = new ArrayList<>();
		List<Integer> list3 = new ArrayList<>();
		List<Integer> list4 = new ArrayList<>();
		List<Integer> list5 = new ArrayList<>();
		ProdService service = new ProdServiceImpl();

		if (!data.equals("undefined")) {
			JSONObject jsonObject = new JSONObject(data);
			JSONArray jArray = jsonObject.getJSONArray("4");
			JSONArray jArray1 = jsonObject.getJSONArray("0");
			JSONArray jArray2 = jsonObject.getJSONArray("3");
			JSONArray jArray3 = jsonObject.getJSONArray("2");
			JSONArray jArray4 = jsonObject.getJSONArray("1");

			if (jArray != null) {

				for (int i = 0; i < jArray.length(); i++) {

					list1.add(jArray.getString(i));

				}

			}
			if (jArray1 != null) {

				for (int i = 0; i < jArray1.length(); i++) {

					list2.add(jArray1.getInt(i));

				}

			}
			if (jArray2 != null) {

				for (int i = 0; i < jArray2.length(); i++) {

					list3.add(jArray2.getInt(i));

				}

			}
			if (jArray3 != null) {

				for (int i = 0; i < jArray3.length(); i++) {

					list4.add(jArray3.getInt(i));

				}

			}
			if (jArray4 != null) {

				for (int i = 0; i < jArray4.length(); i++) {

					list5.add(jArray4.getInt(i));

				}

			}
		}

		int total = service.totalViews(list1,list2,list3,list4,list5);
		List<ProdVO> list = service.prodList3(page, list1,list2,list3,list4,list5);

		PageDTO dto = new PageDTO(page, total);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageInfo", dto);

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		return json + ".json";
	}

}
