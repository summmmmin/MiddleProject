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
		return mapper.selectSellList(userId, page);
	}
	@Override
	public int sellUserCount(String userId) {
		return mapper.getCountSellUser(userId);
	}

	@Override
	public SellVO getSellId(int sellId) {
		return mapper.searchSell(sellId);
	}

	@Override
	public List<SellVO> SellList(int page) {
		return mapper.SellList(page);
	}
	@Override
	public int sellCount() {
		return mapper.getCountSell();
	}

	@Override
	public boolean addSell(SellVO vo) {
		mapper.insertDlvy();
		return mapper.insertSell(vo)==1;
	}
	@Override
	public boolean addSellBid(SellVO vo) {
		return mapper.insertSellBid(vo)==1;
	}

}
