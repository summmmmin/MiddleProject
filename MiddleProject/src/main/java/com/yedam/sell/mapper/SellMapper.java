package com.yedam.sell.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.sell.domain.SellVO;

public interface SellMapper {
	//판매내역(회원)
	public List<SellVO> selectSellList(@Param("userId") String userId, @Param("page") int page);	
	//데이터수
	public int getCountSellUser(String userId);
	//판매내역상세
	public SellVO searchSell(int sellId);
	
	//판매내역(관리자)
	public List<SellVO> SellList(int page);
	//총데이터수
	public int getCountSell();
	
	//즉시판매
	public int insertSell(SellVO vo);
	//구매상태변경
	public int setBuyId(SellVO vo);
	
	//판매입찰
	public int insertSellBid(SellVO vo);
	
	//상태변경
	public int cancelSell(@Param("sellId") int sellId, @Param("cancel") String cancel);
	public int dlvySell(@Param("sellId") int sellId, @Param("sdlvy") String sdlvy);
	public int updateBuyState(@Param("sellId") int sellId, @Param("bdlvy") String bdlvy);
	
	//정산계좌변경
	public int updateAcct(@Param("sellId") int sellId, @Param("sellAccount") String sellAccount);
	//즉시구매가
	public SellVO selectSellPrice(SellVO vo);
}
