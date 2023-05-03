package com.yedam.buy.domain;

import lombok.Data;

@Data
public class BuyVO {
	private int buyId;			//주문번호
	private String userId;		//주문자
	private int sellId;			//판매번호
	private int pdtId;			//상품번호
	private int sizeId;			//사이즈번호
	private String buyDate;		//주문일자
	private int buyPrice;		//주문가격
	private String buyDlvy;		//주문배송
	private String buyCancel;	//주문취소
}
