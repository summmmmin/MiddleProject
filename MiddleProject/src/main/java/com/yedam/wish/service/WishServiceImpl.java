package com.yedam.wish.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.wish.domain.WishVO;
import com.yedam.wish.mapper.WishMapper;

public class WishServiceImpl implements WishService {
	private static WishServiceImpl instance = new WishServiceImpl();
	private SqlSession session;
	private WishMapper mapper;

	public WishServiceImpl() {
		session = DataSource.getInstance().openSession(true);
		mapper = session.getMapper(WishMapper.class);
	}

	public static WishServiceImpl getInstance() {
		return instance;
	}
	
	@Override
	public List<WishVO> wishList(String userId) {
		// TODO Auto-generated method stub
		return mapper.wishList(userId);
	}
}
