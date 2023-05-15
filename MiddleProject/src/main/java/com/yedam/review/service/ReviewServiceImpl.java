package com.yedam.review.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.review.domain.ReviewVO;
import com.yedam.review.mapper.ReviewMapper;

public class ReviewServiceImpl implements ReviewService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);
	
	@Override
	public boolean addReview(ReviewVO vo) {
		return mapper.insertReview(vo) == 1;
	}
	@Override
	public boolean removeReview(int reviewId) {
		return mapper.deleteReview(reviewId) == 1;
	}
	@Override
	public ReviewVO searchReview(int reviewId) {
		return mapper.searchReview(reviewId);
	}
	@Override
	public List<ReviewVO> prodReview(int pdtId, int page) {
		return mapper.prodReview(pdtId, page);
	}
	@Override
	public List<ReviewVO> myReview(String userId, int page) {
		return mapper.myReview(userId, page);
	}
	@Override
	public int totalCount(int pdtId) {
		return mapper.getCountReview(pdtId);
	}
	@Override
	public int getMyReviewCount(String userId) {
		return mapper.getMyReviewCount(userId);
	}
	
}
