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
	private int buyPrice;		//상품가격
	private String buyDlvy;		//주문배송
	private String buyCancel;	//주문취소
	private int buyFincost;		//결제금액
	private int buyPoint;		//사용포인트
	private String buyReturn;		//반품
}
