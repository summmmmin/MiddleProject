package com.yedam.buy.service;

import com.yedam.buy.domain.BuyVO;

public interface BuyService {
	public BuyVO getBuyPrice(BuyVO vo);
	
	//체결시판매번호넣기
	public boolean insertSellId(int sellId, int buyId);
}
