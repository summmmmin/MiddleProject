package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.mapper.ProdMapper;

public class ProdServiceImpl implements ProdService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProdMapper mapper = session.getMapper(ProdMapper.class);
	
	@Override
	public List<ProdVO> prodList(int page) {
		return mapper.prodList(page);
	}
	@Override
	public boolean addProd(ProdVO vo) {
		return mapper.insertProd(vo) == 1;
	}
	@Override
	public boolean modifyProd(ProdVO vo) {
		return mapper.updateProd(vo) == 1;
	}
	@Override
	public boolean removeProd(int prodId) {
		return mapper.deleteProd(prodId) == 1;
	}
	@Override
	public ProdVO getProd(int prodId) {
//		mapper.updateViews(prodId);
		return mapper.searchProd(prodId);
	}
	@Override
	public int totalViews() {
		return mapper.getViews();
	}
	@Override
	public List<ProdVO> catList() {
		return mapper.catList();
	}
	@Override
	public List<ProdVO> subcatList() {
		return mapper.subcatList();
	}
	@Override
	public List<ProdVO> brdList() {
		return mapper.brdList();
	}
	@Override
	public List<ProdVO> genderList() {
		return mapper.genderList();
	}
	
}
