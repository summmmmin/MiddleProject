package com.yedam.qna.service;

import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.domain.QnaVO;

public interface QCommentService {
	public boolean modifyQcomment(QCommentVO vo);
	public QCommentVO getComment(int qId);
	public boolean addComment(QCommentVO vo);
}
