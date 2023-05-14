package com.yedam.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.review.domain.ReviewVO;

public interface ReviewMapper {
	public int insertReview(ReviewVO vo);
	public int deleteReview(int reviewId);
	public ReviewVO searchReview(int reviewId);
	public List<ReviewVO> prodReview(int pdtId);
	public List<ReviewVO> myReview(@Param("userId") String userId, @Param("page") int page);
	public int getCount();
	public int getMyReviewCount(String userId, int pdtId);
}
