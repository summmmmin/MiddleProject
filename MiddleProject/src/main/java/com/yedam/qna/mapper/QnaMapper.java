package com.yedam.qna.mapper;

import java.util.List;

import com.yedam.qna.domain.QnaVO;



public interface QnaMapper {
	public List<QnaVO> qnaList(); //qna 리스트
	public List<QnaVO> qnaWithPage(int page);//페이징리스트.
	public int insertQna(QnaVO vo); // qna 등록
	public int updateQna(QnaVO vo); // qna 수정
	public QnaVO searchQna(int qnaId); // qna 상세
	public int getQnaCount(); // qna 총 개수
	public int deleteQna(int qid);
}
