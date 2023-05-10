package com.yedam.product.mapper;

import java.util.List;

import com.yedam.product.domain.ProdVO;

public interface ProdMapper {
	public List<ProdVO> prodList(int page);
	public int insertProd(ProdVO vo);
	public int deleteProd(int pdtId);
	public int updateProd(ProdVO vo);
	public ProdVO searchProd(int pdtId);
	public int updateViews(int pdtId);
	public int getViews();
	
	public List<ProdVO> catList();
	public List<ProdVO> subcatList();
	public List<ProdVO> brdList();
	public List<ProdVO> genderList();
	public List<ProdVO> prodList2();
	public int getCount(int catId);
	public List<ProdVO> prodList3();
}
