package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class DelProdControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		ProdService service = new ProdServiceImpl();
		service.removeProd(Integer.parseInt(pid));
		
		return "prodList.do";
	}

}
