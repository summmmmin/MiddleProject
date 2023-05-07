package com.yedam.qna.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.mapper.QCommentMapper;

public class QCommentServiceImpl implements QCommentService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	QCommentMapper mapper = session.getMapper(QCommentMapper.class);

	@Override
	public boolean modifyQcomment(QCommentVO vo) {
		return mapper.updateReply(vo) ==1;
	}

	@Override
	public QCommentVO getComment(int qId) {
		return mapper.getcomment(qId);
	}

	@Override
	public boolean addComment(QCommentVO vo) {
		return mapper.insertComment(vo) == 1;
	}

}
