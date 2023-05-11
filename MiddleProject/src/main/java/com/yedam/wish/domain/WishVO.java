package com.yedam.wish.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder



public class WishVO {
	private int wishId;
	private int userId;
	private int pdtId;
	private Date wishDate;
	private String pdtNm;	// 상품이름
	private String pdtImg;	// 상품사진
	private int pdtPrice;	// 상품가격
}
