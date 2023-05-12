package com.yedam.buy.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class BuyPayControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 결제하기
		String pid = req.getParameter("pid");
		String sizeId = req.getParameter("size");
		String name = req.getParameter("dlv_name");
		String phone = req.getParameter("dlv_phone");
		String code = req.getParameter("dlv_code");
		String addr = req.getParameter("dlv_addr");
		String detail = req.getParameter("dlv_detail");
		String price = req.getParameter("price");
		String total = req.getParameter("total");
		String point = req.getParameter("point");
		if(point == "" || point == null || point == "0") {
			point = "0";
		}
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo");
	    UserService userService = new UserServiceImpl();
	    UserVO userpoint = new UserVO();
	    int sum = (int) (user.getUserPoint() - Integer.parseInt(point) + Integer.parseInt(price)*0.001);
	    userpoint.setUserPoint(sum);
	    userpoint.setUserId(user.getUserId());
	    
	    BuyService buyService = new BuyServiceImpl();
		BuyVO buy = new BuyVO();
	    //판매번호
	    SellService sellService = new SellServiceImpl();
	    SellVO sell = new SellVO();
	    sell.setPdtId(Integer.parseInt(pid));
	    sell.setSizeId(Integer.parseInt(sizeId));
	    
	    //insert 값
	    buy.setUserId(user.getUserId());
	    buy.setPdtId(Integer.parseInt(pid));
	    buy.setSizeId(Integer.parseInt(sizeId));
	    buy.setBuyPrice(Integer.parseInt(price));
	    buy.setBuyPoint(Integer.parseInt(point));
	    buy.setBuyFincost(Integer.parseInt(total));
	    buy.setDlvName(name);
	    buy.setDlvAddr("("+code+")"+addr+","+detail);
	    buy.setDlvPhone(phone);
	    if(sellService.getSellPrice(sell) != null) {
	    	//즉시구매
	    	sell = sellService.getSellPrice(sell);
	    	if(sell.getSellPrice() == Integer.parseInt(price)) {
		    	//즉시구매
		    	if(sell.getBuyId()==0) {
		    		buy.setSellId(sell.getSellId());
		    		buyService.addBuy(buy);
		    		userService.updatePoint(userpoint);
		    	}else {
		    		System.out.println("오류(체결됨)");
		    		return "";
		    	}
		    }
	    } else {
	    	//구매입찰
	    	buyService.addBuyBid(buy);
	    	userService.updatePoint(userpoint);
	    }
	    
		return "buy/complete.tiles";
	}

}
