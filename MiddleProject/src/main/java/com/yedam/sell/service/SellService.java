package com.yedam.sell.service;

import java.util.List;

import com.yedam.sell.domain.SellVO;

public interface SellService {
	public List<SellVO> getSellList(String userId, int page);	//판매내역(회원)
	public int sellCount(String userId);	//데이터수
	public SellVO getSellId(int sellId);	//판매상세
	
	public List<SellVO> SellList(int page);	//판매내역(관리자)
	public int sellTotalCount();	//데이터수
	
	public boolean addSell(SellVO vo);	//즉시판매
	public boolean addSellBid(SellVO vo); //판매입찰
	
	public boolean cancelSell(int sellId, String state);
	public boolean dlvySell(int sellId, String state);
	public boolean updateBuyState(int sellId, String state);
	
	public boolean modifyAcct(int sellId, String sellAccount);
}
