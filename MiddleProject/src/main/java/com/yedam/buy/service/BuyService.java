package com.yedam.buy.service;

import java.util.List;

import com.yedam.buy.domain.BuyVO;

public interface BuyService {
	//즉시구매
	public boolean addBuy(BuyVO vo);
	//구매입찰
	public boolean addBuyBid(BuyVO vo);
	//구매내역 사용자
	public List<BuyVO> getBuyList(String userId, int page);
	public int buyCount(String userId);
	//구매내역 관리자
	public List<BuyVO> BuyList(int page);
	public int buyTotalCount();
	//구매상세
	public BuyVO getBuyId(int buyId);
	//즉시판매가
	public BuyVO getBuyPrice(BuyVO vo);
	
	//상태변경
	public boolean cancelBuy(String state, int buyId);
	public boolean returnBuy(String state, int buyId);
	public boolean deliveBuy(String state, int buyId);
	//배송지변경
	public boolean modifyDlvy(BuyVO vo);
	//배송완료
	public boolean completeDlvy();
}
