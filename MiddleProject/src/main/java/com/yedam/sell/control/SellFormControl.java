package com.yedam.sell.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;

public class SellFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");	//상품번호
		String size = req.getParameter("size");	//사이즈
		String inprice = req.getParameter("inPrice");//판매입찰가
		String price = req.getParameter("price");	//즉시판매가
		
		//구매번호
		BuyService buyService = new BuyServiceImpl();
		BuyVO buyid = new BuyVO();
		buyid.setPdtId(Integer.parseInt(pid));
		buyid.setSizeId(Integer.parseInt(size));
		buyid = buyService.getBuyPrice(buyid);
		if(inprice == null || inprice.equals("")) {
			//즉시판매일때(판매입찰가 없을때)
			if(buyid.getBuyPrice() != Integer.parseInt(price)) {
				System.out.println("구매번호없음");
				return null;
			}else {
				//즉시판매
				//배송정보id생성
				//판매번호생성(판매상태=발송요청, 구매번호)
				//구매(판매번호넣기)
				
			}
		}else {
			//판매입찰일때
			//배송정보id생성
			//판매번호생성, 판매상태=판매입찰중
		}
		
		return "sell/sellForm.tiles";
	}

}
