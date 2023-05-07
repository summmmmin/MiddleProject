package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class ModifyProdControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getMethod().equals("GET")) {
			String pid = req.getParameter("pid");
			
			ProdService service = new ProdServiceImpl();
			ProdVO vo = service.getProd(Integer.parseInt(pid));
			req.setAttribute("prodInfo", vo);
			
			return "product/prodModify.tiles";
			
		} else if(req.getMethod().equals("POST")) {
			String pid = req.getParameter("pid");
			String pdtName = req.getParameter("pdtName");
			String price = req.getParameter("price");
			
			ProdService service = new ProdServiceImpl();
			ProdVO vo = new ProdVO();
			vo.setPdtId(Integer.parseInt(pid));
			vo.setPdtNm(pdtName);
			vo.setPdtPrice(Integer.parseInt(price));
			service.modifyProd(vo);
			
		}
		return "prodList.do";
	}

}
