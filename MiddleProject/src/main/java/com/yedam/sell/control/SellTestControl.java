package com.yedam.sell.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

public class SellTestControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String prodId = req.getParameter("prodId");
		
		//상품정보
		ProdService pdtService = new ProdServiceImpl();
		ProdVO pdt = pdtService.getProd(Integer.parseInt(prodId));
		req.setAttribute("prodInfo", pdt);
		
		//상품의 사이즈리스트
		SizeService sizeService = new SizeServiceImpl();
		List<SizeVO> sizeList = sizeService.getSizeList(pdt.getCatId());
		req.setAttribute("sizeList", sizeList);
		
		//즉시판매가
		BuyService buyService = new BuyServiceImpl();
		List<BuyVO> priceList = new ArrayList<BuyVO>();
		BuyVO buy = new BuyVO();
		for(int i=0; i<sizeList.size(); i++) {
			buy = new BuyVO();
			buy.setPdtId(pdt.getPdtId());
			buy.setSizeId(sizeList.get(i).getSizeId());
			buy = buyService.getBuyPrice(buy);
			priceList.add(buy);
		}
		req.setAttribute("priceList", priceList);
		
		System.out.println(pdt);
		System.out.println(sizeList);
		System.out.println(priceList);
		return "sell/sellTest.tiles";
	}

}
