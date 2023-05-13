package com.yedam.review.service;

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
	
	
}
