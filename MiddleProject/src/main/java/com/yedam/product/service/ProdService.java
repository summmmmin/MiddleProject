package com.yedam.product.service;

import java.util.List;

import com.yedam.product.domain.ProdVO;

public interface ProdService {
	public List<ProdVO> prodList(int page);
	public boolean addProd(ProdVO vo);
	public boolean modifyProd(ProdVO vo);
	public boolean removeProd(int prodId);
	public ProdVO getProd(int prodId);
	public int totalViews();
	public List<ProdVO> catList();
}
