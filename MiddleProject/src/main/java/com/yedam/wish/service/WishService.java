package com.yedam.wish.service;

import java.util.List;

import com.yedam.wish.domain.WishVO;

public interface WishService {
	public List<WishVO> wishList(String userId);
	public boolean deletewishList(int wishId);
	
}
