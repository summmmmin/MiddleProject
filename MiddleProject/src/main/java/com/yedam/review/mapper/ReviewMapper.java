package com.yedam.review.mapper;

import com.yedam.review.domain.ReviewVO;

public interface ReviewMapper {
	public int insertReview(ReviewVO vo);
	public int deleteReview(int reviewId);
	public ReviewVO searchReview(int reviewId);
}
