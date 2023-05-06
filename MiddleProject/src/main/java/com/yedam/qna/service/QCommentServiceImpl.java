package com.yedam.qna.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.mapper.QCommnetMapper;

public class QCommentServiceImpl implements QCommentService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	QCommnetMapper mapper = session.getMapper(QCommnetMapper.class);

	@Override
	public boolean modifyQcomment(QCommentVO vo) {
		return mapper.updateReply(vo) ==1;
	}

}
