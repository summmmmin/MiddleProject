package com.yedam.buy.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.mapper.BuyMapper;
import com.yedam.common.DataSource;

public class BuyServiceImpl implements BuyService {
	SqlSession session = DataSource.getInstance().openSession(true);
	BuyMapper mapper = session.getMapper(BuyMapper.class);
	
	@Override
	public BuyVO getBuyPrice(BuyVO vo) {
		//즉시판매가
		return mapper.selectBuyPrice(vo);
	}

	@Override
	public boolean addBuy(BuyVO vo) {
		// 즉시구매
		int insert = mapper.insertBuy(vo);
		int sell = mapper.setSellId(vo);
		return insert==2 && sell==1;
	}

	@Override
	public boolean addBuyBid(BuyVO vo) {
		// 구매입찰
		return mapper.insertBuyBid(vo)==2;
	}

	@Override
	public List<BuyVO> getBuyList(String userId, int page) {
		//사용자 구매 내역
		return mapper.selectBuyList(userId, page);
	}

	@Override
	public int buyCount(String userId) {
		// 사용자 구매내역 수
		return mapper.countBuy(userId);
	}

	@Override
	public List<BuyVO> BuyList(int page) {
		// 전체구매내역
		return mapper.BuyList(page);
	}

	@Override
	public int buyTotalCount() {
		// 전체 구매수
		return mapper.getCountBuy();
	}

	@Override
	public BuyVO getBuyId(int buyId) {
		// 구매상세
		return mapper.selectBuy(buyId);
	}

	@Override
	public boolean cancelBuy(BuyVO vo) {
		// 취소상태변경
		return mapper.cancelBuy(vo)==1;
	}

	@Override
	public boolean returnBuy(BuyVO vo) {
		// 반품상태변경
		return mapper.returnBuy(vo)==1;
	}

	@Override
	public boolean deliveBuy(BuyVO vo) {
		// 배송상태변경
		return mapper.deliveBuy(vo)==1;
	}

	@Override
	public boolean modifyDlvy(BuyVO vo) {
		// 배송지변경
		return mapper.updateDlvy(vo)==1;
	}

	@Override
	public boolean completeDlvy() {
		// 배송완료
		return mapper.completeDlvy()==1;
	}
}
