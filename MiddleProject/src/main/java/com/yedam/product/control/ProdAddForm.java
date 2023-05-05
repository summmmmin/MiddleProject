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

public class ProdAddForm implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProdService service = new ProdServiceImpl();
		List<ProdVO> list = service.catList();
		List<ProdVO> list2 = service.subcatList();
		List<ProdVO> list3 = service.brdList();
		List<ProdVO> list4 = service.genderList();
		
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		req.setAttribute("list3", list3);
		req.setAttribute("list4", list4);
		
		return "product/prodAddForm.tiles";
	}

}
