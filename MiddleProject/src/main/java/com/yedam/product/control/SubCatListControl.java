package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class SubCatListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProdService service = new ProdServiceImpl();
		List<ProdVO> list = service.subcatList();
		
		String json = "[";
		for(int i=0; i<list.size(); i++) {
			json += "{\"subcatId\":"+list.get(i).getSubcatId()+","
					+ "\"catId\":"+list.get(i).getCatId()+","
					+ "\"subcatNm\":\""+list.get(i).getSubcatNm()+"\"}";
			if (i != list.size() - 1) {
				json += ",";
			}
		}
		json += "]";
		return json + ".json";
	}

}
