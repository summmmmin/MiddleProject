package com.yedam.note.service;

import java.util.List;

import com.yedam.note.domain.NoteVO;
import com.yedam.user.domain.UserVO;

public interface NoteService {
	public List<NoteVO> noteList(String userId);
	public boolean delNote(int noteId); // 쪽지 지우기
	public boolean  delAllNote(String userId); // 쪽지 전체지우기
	public NoteVO getNote(int noteId); // 쪽지 상세보기
	public boolean sendNote(NoteVO vo); // 쪽지 보내기
	public UserVO allUser();
}
