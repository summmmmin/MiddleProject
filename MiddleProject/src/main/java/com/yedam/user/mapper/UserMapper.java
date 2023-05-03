package com.yedam.user.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.user.domain.UserVO;

public interface UserMapper {
	public UserVO loginCheck(UserVO vo);
	public int modifyMember(UserVO vo);
    public UserVO getUser(String email);
    public List<Map<String, Object>> memberByDept();
}
