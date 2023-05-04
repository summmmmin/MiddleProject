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
}
