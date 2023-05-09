package com.yedam.product.domain;

import lombok.Data;

@Data
public class ProdVO {
	private int pdtId;
	private int catId;
	private int subcatId;
	private int brdId;
	private int genderId;
	private String pdtNm;
	private int pdtPrice;
	private String pdtImg;
	private int pdtViews;
	
	private String catNm;
	private String subcatNm;
	private String brdNm;
	private String genderNm;
	private String sizeNm;
	
}
