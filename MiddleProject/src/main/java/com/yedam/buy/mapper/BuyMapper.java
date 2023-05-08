package com.yedam.buy.mapper;

import org.apache.ibatis.annotations.Param;

import com.yedam.buy.domain.BuyVO;

public interface BuyMapper {
	//즉시판매가
	public BuyVO selectBuyPrice(BuyVO vo);
	//구매상세
	public BuyVO selectBuy(int buyId);
	
	//체결(판매아이디넣기)
	public int insertSellId(@Param("sellId") int sellId, @Param("buyId") int buyId);
}