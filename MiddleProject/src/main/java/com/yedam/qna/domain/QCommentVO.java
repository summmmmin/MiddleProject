package com.yedam.qna.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QCommentVO {
	private int commentId;
	private int postId;
	private String userNM;
	private String commentCT;
	private Date commentDate;
}
