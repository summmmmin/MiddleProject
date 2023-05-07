package com.yedam.qna.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QCommentVO {
	private int postId;
	private String userGrade;
	private String commentCT;
	private Date commentDate;
}
