package com.yedam.product.service;

import java.util.ArrayList;
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
	public boolean removeProd(int pdtId) {
		return mapper.deleteProd(pdtId) == 1;
	}

	@Override
	public ProdVO getProd(int pdtId) {
		mapper.updateViews(pdtId);
		return mapper.searchProd(pdtId);
	}

	@Override
	public int totalViews(List<String> list,List<Integer> list2,List<Integer> list3,List<Integer> list4,List<Integer> list5) {
		return mapper.getViews(list, list2, list3, list4, list5);
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

	@Override
	public List<ProdVO> prodList2() {
		return mapper.prodList2();
	}

	@Override
	public int getCount(int catId) {
		return mapper.getCount(catId);
	}

	@Override
	public List<ProdVO> prodList3(int page,List<String> list,List<Integer> list2,List<Integer> list3,List<Integer> list4,List<Integer> list5) {

		return mapper.prodList3(page, list, list2, list3, list4, list5);
	}

	@Override
	public int getSubcatCount(int subcatId) {
		return mapper.getSubcatCount(subcatId);
	}

	@Override
	public int getBrdCount(int brdId) {
		return mapper.getBrdCount(brdId);
	}

	@Override
	public int getGenderCount(int genderId) {
		return mapper.getGenderCount(genderId);
	}
	
}
