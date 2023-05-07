package com.yedam.qna.mapper;

import com.yedam.qna.domain.QCommentVO;

public interface QCommentMapper {
	public int updateReply(QCommentVO vo);
	public QCommentVO getcomment(int qid);
	public int insertComment(QCommentVO vo);
}
