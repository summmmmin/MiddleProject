package com.yedam.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.product.domain.ProdVO;

public interface ProdMapper {
	public List<ProdVO> prodList(int page);
	public int insertProd(ProdVO vo);
	public int deleteProd(int pdtId);
	public int updateProd(ProdVO vo);
	public ProdVO searchProd(int pdtId);
	public int updateViews(int pdtId);
	public int getViews(@Param("list") List<String> list, @Param("list2") List<Integer> list2, 
			@Param("list3") List<Integer> list3, @Param("list4") List<Integer> list4, @Param("list5") List<Integer> list5);
	
	public List<ProdVO> catList();
	public List<ProdVO> subcatList();
	public List<ProdVO> brdList();
	public List<ProdVO> genderList();
	public List<ProdVO> prodList2();
	public int getCount(int catId);
	public List<ProdVO> prodList3(@Param("page") int page, @Param("list") List<String> list, @Param("list2") List<Integer> list2, 
			  						@Param("list3") List<Integer> list3, @Param("list4") List<Integer> list4, @Param("list5") List<Integer> list5);
	public int getSubcatCount(int subcatId);
	public int getBrdCount(int brdId);
	public int getGenderCount(int genderId);
}
