package com.yedam.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.qna.domain.QnaVO;



public interface QnaMapper {
	public List<QnaVO> myQna(@Param("userId") String userId, @Param("page") int page); //나의qna 리스트
	public List<QnaVO> qnaWithPage(int page); //페이징리스트
	public int insertQna(QnaVO vo); // qna 등록
	public int updateQna(QnaVO vo); // qna 수정
	public QnaVO searchQna(int qnaId); // qna 상세
	public int getQnaCount(); // qna 총 개수
	public int getMyQnaCount(String userId); // myqna 총 개수
	public int deleteQna(int qid); //qna 지우기
}
