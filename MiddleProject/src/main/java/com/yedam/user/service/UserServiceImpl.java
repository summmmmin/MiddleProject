package com.yedam.user.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.user.domain.UserVO;
import com.yedam.user.mapper.UserMapper;


public class UserServiceImpl implements UserService {
	private static UserServiceImpl instance = new UserServiceImpl();
	private SqlSession session;
	private UserMapper mapper;

	public UserServiceImpl() {
		session = DataSource.getInstance().openSession(true);
		mapper = session.getMapper(UserMapper.class);
	}

	public static UserServiceImpl getInstance() {
		return instance;
	}
	
	@Override
	public UserVO loginCheck(String UserId, String UserPw) {
		UserVO vo = new UserVO();
		vo.setUserId(UserId);
		vo.setUserPw(UserPw);

		UserVO member = mapper.loginCheck(vo);
		return member;
	}
}
