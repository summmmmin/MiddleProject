package com.yedam.qna.mapper;

import com.yedam.qna.domain.QCommentVO;

public interface QCommnetMapper {
	public int updateReply(QCommentVO vo);
	public QCommentVO getcomment(int qid);
}
