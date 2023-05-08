package com.yedam.buy.mapper;

import com.yedam.buy.domain.BuyVO;

public interface BuyMapper {
	//즉시판매가
	public BuyVO selectBuyPrice(BuyVO vo);
	//구매상세
	public BuyVO selectBuy(int buyId);
}