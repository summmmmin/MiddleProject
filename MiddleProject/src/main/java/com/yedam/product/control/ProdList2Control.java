package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.PageDTO;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class ProdList2Control implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ProdService service = new ProdServiceImpl();
		int total = service.totalViews();
		List<ProdVO> list = service.prodList(page);
		System.out.println(list);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		String json = "";
		for(int i = 0; i < list.size(); i++) {
			json += "{\"pdtId\":" + list.get(i).getPdtId() + ",";
			json += "\"catId\":" + list.get(i).getCatId() + ",";
			json += "\"subcatId\":" + list.get(i).getSubcatId() + ",";
			json += "\"brdId\":" + list.get(i).getBrdId() + ",";
			json += "\"genderId\":" + list.get(i).getGenderId() + ",";
			json += "\"pdtNm\":" + list.get(i).getPdtNm() + ",";
			json += "\"pdtPrice\":" + list.get(i).getPdtPrice() + ",";
			json += "\"pdtImg\":" + list.get(i).getPdtImg() + ",";
			json += "\"pdtViews\":" + list.get(i).getPdtViews() + ",";
			json += "\"pdtDel\":" + list.get(i).getPdtDel() + ",";
			json += "\"catNm\":" + list.get(i).getCatNm() + ",";
			json += "\"subcatNm\":" + list.get(i).getSubcatNm() + ",";
			json += "\"brdNm\":" + list.get(i).getBrdNm() + ",";
			json += "\"genderNm\":" + list.get(i).getGenderNm() + ",";
			json += "\"sizeNm\":" + list.get(i).getSizeNm() + "\"}";
			System.out.println(json);
			
			if(i+1 != list.size()) {
				json += ",";
			}
			
			String cat = "";
			for(i = 0; i<list.size(); i++) {
				cat += list.get(i).getCatId();
				if(i != list.size() -1) {
					cat += ",";
				}
			}
			
			String[] catArr = new String[list.size()];
			cat = "";
			for(i = 0; i<catArr.length; i++) {
				cat += catArr[i];
				if(i != catArr.length -1) {
					cat += ",";
				}
			}
		}
		return json + ".json";
	}

}
