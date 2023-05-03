package com.yedam.size.service;

import java.util.List;

import com.yedam.size.domain.SizeVO;

public interface SizeService {
	public List<SizeVO> getSizeList(int catId);
}
