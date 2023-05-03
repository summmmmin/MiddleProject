package com.yedam.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;


public class UsersServiceImpl {
	SqlSession session = DataSource.getInstance().openSession(true);
	EventMapper mapper = session.getMapper(EventMapper.class);


	@Override
	public boolean addEvent(EventVO event) {
		return mapper.insertEvent(event) == 1;
	}

	@Override
	public boolean removeEvent(EventVO event) {
		return mapper.deleteEvent(event) == 1;
	}
}
