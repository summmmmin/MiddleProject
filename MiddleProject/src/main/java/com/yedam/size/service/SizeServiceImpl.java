package com.yedam.size.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.size.domain.SizeVO;
import com.yedam.size.mapper.SizeMapper;

public class SizeServiceImpl implements SizeService {
	SqlSession session = DataSource.getInstance().openSession(true);
	SizeMapper mapper = session.getMapper(SizeMapper.class);
	
	@Override
	public List<SizeVO> getSizeList(int catId) {
		return mapper.selectSizeList(catId);
	}
}
