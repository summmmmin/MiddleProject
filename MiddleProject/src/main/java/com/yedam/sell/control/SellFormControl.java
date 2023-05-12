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
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.service.SellService;
import com.yedam.sell.service.SellServiceImpl;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class SellFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");	//상품번호
		String size = req.getParameter("size");	//사이즈
		String name = req.getParameter("acc_named"); //계좌이름
		String acc = req.getParameter("acc"); //계좌
		String price = req.getParameter("sprice"); //가격
		String total = req.getParameter("stotal"); //총합
		HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo");
	    UserService userService = new UserServiceImpl();
	    UserVO userpoint = new UserVO();
	    userpoint.setUserPoint((int)(user.getUserPoint()+Integer.parseInt(price)*0.001));
		//구매번호
		BuyService buyService = new BuyServiceImpl();
		BuyVO buy = new BuyVO();
		buy.setPdtId(Integer.parseInt(pid));
		buy.setSizeId(Integer.parseInt(size));
		
		SellService sellService = new SellServiceImpl();
		SellVO sell = new SellVO();
		sell.setUserId(user.getUserId());
		sell.setPdtId(Integer.parseInt(pid));
		sell.setSellPrice(Integer.parseInt(price));
		sell.setSizeId(Integer.parseInt(size));
		sell.setSellAccount(name+'/'+acc);
		
		if(buyService.getBuyPrice(buy) != null) {
			//즉시판매
			buy = buyService.getBuyPrice(buy);
			if(buy.getBuyPrice()==Integer.parseInt(price)) {
				if(buy.getSellId()==0) {
					sell.setBuyId(buy.getSellId());
					sellService.addSell(sell);
					userService.updatePoint(userpoint);
				}else {
					System.out.println("오류(체결)");
					return "";
				}
			}
		} else {
			sellService.addSellBid(sell);
			userService.updatePoint(userpoint);
		}
		
		return "buy/complete.tiles";
	}

}
