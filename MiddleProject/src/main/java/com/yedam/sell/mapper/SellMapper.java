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
	public List<SellVO> SellList(@Param("page") int page,@Param("list") List<String> list,@Param("list2") List<String> list2);
	//총데이터수
	public int getCountSell(@Param("list") List<String> list,@Param("list2") List<String> list2);
	
	//즉시판매
	public int insertSell(SellVO vo);
	//구매상태변경
	public int setBuyId(SellVO vo);
	
	//판매입찰
	public int insertSellBid(SellVO vo);
	
	//상태변경
	public int cancelSell(SellVO vo);
	public int dlvySell(SellVO vo);
	
	//정산계좌변경
	public int updateAcct(SellVO vo);
	//즉시구매가
	public SellVO selectSellPrice(SellVO vo);
}
