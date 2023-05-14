package com.yedam.sell.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;
import com.yedam.size.domain.SizeVO;
import com.yedam.size.service.SizeService;
import com.yedam.size.service.SizeServiceImpl;
import com.yedam.user.domain.UserVO;

public class SellPriceControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodId = req.getParameter("prodId");
		String sizeId = req.getParameter("size");
		
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo"); //로그인된 정보
	    ProdService prodService = new ProdServiceImpl();
	    SizeService sizeService = new SizeServiceImpl();	    
		BuyService buyService = new BuyServiceImpl();
		
		BuyVO buy = new BuyVO();
		buy.setPdtId(Integer.parseInt(prodId));
		buy.setSizeId(Integer.parseInt(sizeId));
		buy = buyService.getBuyPrice(buy);
		
		if(user == null) {	
			return "loginForm.do";
		}else {
			ProdVO prod = prodService.getProd(Integer.parseInt(prodId));
	    	SizeVO size = sizeService.getSize(Integer.parseInt(sizeId));
	    	req.setAttribute("price", buy);	//즉시판매가
	    	req.setAttribute("prod", prod);
	    	req.setAttribute("user", user);
	    	req.setAttribute("size", size);
		}
		
		return "sell/sellPrice.tiles";
	}

}
