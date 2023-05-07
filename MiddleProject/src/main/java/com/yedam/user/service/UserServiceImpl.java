package com.yedam.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public UserVO loginCheck(String userId, String userPw) {
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setUserPw(userPw);

		UserVO user = mapper.loginCheck(vo);
		return user;
	}
	
	
	@Override
	public boolean addUser(UserVO user) {
		int result = mapper.addUser(user);
		return result == 1;
	}
	
	@Override
	public boolean checkPassword(String userPw, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");

	    UserVO vo = new UserVO();
	    vo.setUserId(userId);
	    vo.setUserPw(userPw);

	    boolean isMatched = mapper.checkPassword(vo);

	    return isMatched;
	}






	
	
}

