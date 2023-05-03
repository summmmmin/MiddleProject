package com.yedam.qna.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QCommentVO {
	private int qcId;
	private int pId;
	private String uName;
	private String qcComment;
	private Date cDate;
}
