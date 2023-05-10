package com.yedam.sell.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.sell.domain.SellVO;
import com.yedam.sell.mapper.SellMapper;

public class SellServiceImpl implements SellService {
	SqlSession session = DataSource.getInstance().openSession(true);
	SellMapper mapper = session.getMapper(SellMapper.class);
	
	@Override
	public List<SellVO> getSellList(String userId, int page) {
		//판매내역(회원)
		return mapper.selectSellList(userId, page);
	}
	@Override
	public int sellCount(String userId) {
		//데이터수
		return mapper.getCountSellUser(userId);
	}
	@Override
	public SellVO getSellId(int sellId) {
		//판매상세
		return mapper.searchSell(sellId);
	}

	@Override
	public List<SellVO> SellList(int page) {
		//판매내역관리
		return mapper.SellList(page);
	}
	@Override
	public int sellTotalCount() {
		// 총판매수
		return mapper.getCountSell();
	}

	@Override
	public boolean addSell(SellVO vo) {
		//즉시판매
		mapper.setBuyId(vo);
		return mapper.insertSell(vo)==2;
	}
	@Override
	public boolean addSellBid(SellVO vo) {
		//판매입찰
		return mapper.insertSellBid(vo)==2;
	}
	
	@Override
	public boolean cancelSell(SellVO vo) {
		return mapper.cancelSell(vo)==1;
	}
	@Override
	public boolean dlvySell(SellVO vo) {
		return mapper.dlvySell(vo)==1;
	}
	@Override
	public boolean modifyAcct(SellVO vo) {
		// 정산계좌변경
		return mapper.updateAcct(vo)==1;
	}
	@Override
	public SellVO getSellPrice(SellVO vo) {
		// 즉시구매가
		return mapper.selectSellPrice(vo);
	}

}
