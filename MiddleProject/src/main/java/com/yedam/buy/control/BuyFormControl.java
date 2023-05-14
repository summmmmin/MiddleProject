package com.yedam.buy.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;
import com.yedam.size.domain.SizeVO;
import com.yedam.size.service.SizeService;
import com.yedam.size.service.SizeServiceImpl;
import com.yedam.user.domain.UserVO;

public class BuyFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pid = req.getParameter("pid");	//상품번호
		String sizeId = req.getParameter("size");	//사이즈
		String inprice = req.getParameter("inPrice");//구매입찰가
		String price = req.getParameter("price");	//즉시구매가
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo"); //로그인된 정보
	    ProdService prodService = new ProdServiceImpl();
	    SizeService sizeService = new SizeServiceImpl();
	    //판매번호
	    SellService sellService = new SellServiceImpl();
	    SellVO sell = new SellVO();
	    sell.setPdtId(Integer.parseInt(pid));
	    sell.setSizeId(Integer.parseInt(sizeId));
	    sell = sellService.getSellPrice(sell);
	    if(user == null) {	
	    	return "loginForm.do";
	    }else {
	    	ProdVO prod = prodService.getProd(Integer.parseInt(pid));
	    	SizeVO size = sizeService.getSize(Integer.parseInt(sizeId));
	    	req.setAttribute("prod", prod);
	   		req.setAttribute("user", user);
	   		req.setAttribute("size", size);
	   		req.setAttribute("sell", sell);
	   		if(inprice == null || inprice.equals("")) {
    			req.setAttribute("price", price);
    		}else {
    			req.setAttribute("price", inprice);
    			System.out.println(inprice);
    		}	    	 
	    	return "buy/buyForm.tiles";	    	
	    }
	    
		
	}

}
