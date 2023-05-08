package com.yedam.note.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.note.mapper.NoteMapper;

public class NoteServiceImpl implements NoteService {
	SqlSession session = DataSource.getInstance().openSession(true);
	NoteMapper mapper = session.getMapper(NoteMapper.class);
}
