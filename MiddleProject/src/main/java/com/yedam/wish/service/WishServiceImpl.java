package com.yedam.wish.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.wish.domain.WishVO;
import com.yedam.wish.mapper.WishMapper;

public class WishServiceImpl implements WishService {
	SqlSession session = DataSource.getInstance().openSession(true);
	WishMapper mapper = session.getMapper(WishMapper.class);

	@Override
	public List<WishVO> wishList(String userId) {
		return mapper.wishList(userId);
	}
	
	@Override
	public boolean deletewishList(int wishId) {
		return mapper.deletewishList(wishId) == 1;
		
	}
	
	@Override
	public boolean addwishList(WishVO wish) {
	    return mapper.addwishList(wish);
	}

}
