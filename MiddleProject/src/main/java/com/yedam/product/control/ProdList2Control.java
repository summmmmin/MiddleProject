package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

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
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ProdService service = new ProdServiceImpl();
		int total = service.totalViews();
		List<ProdVO> list = service.prodList3(page);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		System.out.println(data);
		if(!data.equals("undefined")) {
			JSONObject jsonObject = new JSONObject(data);
			JSONArray jArray = jsonObject.getJSONArray("0");
			
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		return json + ".json";
	}

}
