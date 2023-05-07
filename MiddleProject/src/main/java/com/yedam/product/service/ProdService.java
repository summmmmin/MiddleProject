package com.yedam.product.service;

import java.util.List;

import com.yedam.product.domain.ProdVO;

public interface ProdService {
	public List<ProdVO> prodList(int page);
	public boolean addProd(ProdVO vo);
	public boolean modifyProd(ProdVO vo);
	public boolean removeProd(int pdtId);
	public ProdVO getProd(int pdtId);
	public int totalViews();
	public List<ProdVO> catList();
	public List<ProdVO> subcatList();
	public List<ProdVO> brdList();
	public List<ProdVO> genderList();
	public List<ProdVO> prodList2();
}