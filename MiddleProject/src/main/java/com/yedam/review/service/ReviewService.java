package com.yedam.review.service;

import com.yedam.review.domain.ReviewVO;

public interface ReviewService {
	public boolean addReview(ReviewVO vo);
	public boolean removeReview(int reviewId);
	public ReviewVO searchReview(int reviewId);
}
