package com.yedam.review.service;

import java.util.List;

import com.yedam.review.domain.ReviewVO;

public interface ReviewService {
	public boolean addReview(ReviewVO vo);
	public boolean removeReview(int reviewId);
	public ReviewVO searchReview(int reviewId);
	public List<ReviewVO> prodReview(int pdtId, int page);
	public List<ReviewVO> myReview(String userId, int page);
	public int totalCount(int pdtId);
	public int getMyReviewCount(String userId);
}
