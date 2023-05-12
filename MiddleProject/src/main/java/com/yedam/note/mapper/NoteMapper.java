package com.yedam.note.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.note.domain.NoteVO;
import com.yedam.qna.domain.QnaVO;
import com.yedam.user.domain.UserVO;

public interface NoteMapper {
	public List<NoteVO> noteList(@Param("userId") String userId, @Param("page") int page); //마이페이지 쪽지리스트 
	public boolean delNote(int noteId); // 쪽지 지우기
	public boolean delAllNote(@Param("userId") String userId, @Param("page") int page); // 쪽지 전체지우기
	public NoteVO getNote(int noteId); // 쪽지 상세보기
	public int sendNote(NoteVO vo); // 쪽지 보내기
	public Integer sendAll(String noteCT); //쪽지 모두에게 보내기
	public int getNoteCount(String userId); // 쪽지 총 갯수
	public int updateViews(int noteId);// 쪽지 조회수
	public int readNote(String userId);// 안읽은 쪽지 갯수
}
