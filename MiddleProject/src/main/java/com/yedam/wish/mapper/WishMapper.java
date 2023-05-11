package com.yedam.wish.mapper;

import java.util.List;


import com.yedam.wish.domain.WishVO;

public interface WishMapper {
	public List<WishVO> wishList(String userId);
	public int deletewishList(int wishId);
	public boolean addwishList(WishVO wish);

}
