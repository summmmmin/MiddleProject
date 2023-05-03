package com.yedam.qna.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qId;
	private String UId;
	private String qTitle;
	private String qCT;
	private Date qDate;
}
