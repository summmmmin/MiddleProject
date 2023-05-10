package com.yedam.sell.domain;

import lombok.Data;

@Data
public class SellVO {
	
	private int sellId;		//판매번호
	private String userId;		//판매자
	private int buyId;			//구매번호
	private int pdtId;			//상품번호
	private int sizeId;			//사이즈번호
	private String sellDate;	//판매일자
	private int sellPrice;		//판매가격
	private String sellDlvy;	//배송
	private String sellCancel;	//취소
	private String sellConfirm;	//검수
	private String sellAccount;	//정산계좌
	private String sellPay;		//정산상태

	private String pdtNm;		//상품이름
	private String brdNm;	//브랜드
	private String sizeSize;	//사이즈

	private int dlvId;	//배송id
	private int dlvNum;	//송장번호
	private String dlvName; //이름
	private String dlvphone;//번호
	private String dlvAddr; //주소
}
