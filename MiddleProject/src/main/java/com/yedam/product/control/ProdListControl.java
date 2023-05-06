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

public class ProdListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ProdService service = new ProdServiceImpl();
		int total = service.totalViews();
		List<ProdVO> list = service.prodList(page);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		return "product/prodList.tiles";
	}

}
