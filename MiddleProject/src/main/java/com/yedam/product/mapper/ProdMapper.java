package com.yedam.product.mapper;

import java.util.List;

import com.yedam.product.domain.ProdVO;

public interface ProdMapper {
	public List<ProdVO> prodList(int page);
	public int insertProd(ProdVO vo);
	public int deleteProd(int prodId);
	public int updateProd(ProdVO vo);
	public ProdVO searchProd(int prodId);
	public int updateViews(int prodId);
	public int getViews();
	
	public List<ProdVO> catList();
	public List<ProdVO> subcatList();
	public List<ProdVO> brdList();
	public List<ProdVO> genderList();
	public List<ProdVO> prodList2();
}
