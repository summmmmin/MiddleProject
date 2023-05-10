package com.yedam.wish.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor


public class WishVO {
	private String wishId;
	private String userId;
	private String pdtId;
	private Date wishDate;
}
