package com.yedam.note.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.mapper.NoteMapper;
import com.yedam.user.domain.UserVO;

public class NoteServiceImpl implements NoteService {
	SqlSession session = DataSource.getInstance().openSession(true);
	NoteMapper mapper = session.getMapper(NoteMapper.class);
	@Override
	public List<NoteVO> noteList(int userId) {
		return mapper.myNote(userId);
	}
	@Override
	public boolean delNote(int noteId) {
		return mapper.delNote(noteId);
	}
	@Override
	public int delAllNote(int userId) {
		// TODO Auto-generated method stub
		return mapper.delAllNote(userId);
	}
	@Override
	public NoteVO getNote(int noteId) {
		// TODO Auto-generated method stub
		return mapper.getNote(noteId);
	}
	@Override
	public boolean sendNote(int userId) {
		// TODO Auto-generated method stub
		return mapper.sendNote(userId);
	}
	@Override
	public UserVO allUser() {
		// TODO Auto-generated method stub
		return mapper.allUser();
	}

}
