package com.yedam.size.mapper;

import java.util.List;

import com.yedam.size.domain.SizeVO;

public interface SizeMapper {
	public List<SizeVO> selectSizeList(int catId);
	public SizeVO selectSize(int sizeId);
	public List<SizeVO> sizeList();
}
