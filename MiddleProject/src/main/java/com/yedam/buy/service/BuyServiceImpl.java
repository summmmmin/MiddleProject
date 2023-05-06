package com.yedam.buy.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.mapper.BuyMapper;
import com.yedam.common.DataSource;

public class BuyServiceImpl implements BuyService {
	SqlSession session = DataSource.getInstance().openSession(true);
	BuyMapper mapper = session.getMapper(BuyMapper.class);
	
	@Override
	public BuyVO getBuyPrice(BuyVO vo) {
		return mapper.selectBuyPrice(vo);
	}
}
