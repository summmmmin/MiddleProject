package com.yedam.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.review.domain.ReviewVO;

public interface ReviewMapper {
	public int insertReview(ReviewVO vo);
	public int deleteReview(int reviewId);
	public ReviewVO searchReview(int reviewId);
	public List<ReviewVO> prodReview(@Param("pdtId") int pdtId, @Param("page") int page);
	public List<ReviewVO> myReview(@Param("userId") String userId, @Param("page") int page);
	public int getCountReview(int pdtId);
	public int getMyReviewCount(String userId);
}
