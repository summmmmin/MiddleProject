package com.yedam.user.mapper;


import com.yedam.user.domain.UserVO;

public interface UserMapper {
	public UserVO loginCheck(UserVO vo);
	public int addUser(UserVO vo);
    public boolean checkPassword(UserVO vo);
    public int deleteUser(UserVO vo);

}
