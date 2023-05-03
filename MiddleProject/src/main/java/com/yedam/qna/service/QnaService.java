package com.yedam.qna.service;

import java.util.List;

import com.yedam.qna.domain.QnaVO;


public interface QnaService {
	public List<QnaVO> qnaList(int page);
	public boolean addQna(QnaVO vo);
	public boolean modifyQna(QnaVO vo);
	public QnaVO getQna(int qnaId);
	public int totalQnaCount();
}
