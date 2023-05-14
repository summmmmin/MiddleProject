package com.yedam.review.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewId;
	private int buyId;
	private String reviewCt;
	private String reviewDate;
	private String reviewTitle;
	private String reviewImg;
}
