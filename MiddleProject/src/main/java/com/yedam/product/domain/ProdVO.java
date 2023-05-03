package com.yedam.product.domain;

import lombok.Data;

@Data
public class ProdVO {
	private int pdtId;
	private int catId;
	private int subcatId;
	private String pdtNm;
	private int pdtPrice;
	private String pdtImg;
	private String pdtBrand;
	private int pdtViews;
}
