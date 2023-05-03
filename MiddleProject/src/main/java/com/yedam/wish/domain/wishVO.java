package com.yedam.wish.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data


public class wishVO {
	private String wishId;
	private String userId;
	private String pdtId;
	private Date wishDate;
}
