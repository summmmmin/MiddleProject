package com.yedam.user.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.user.domain.UsersVO;

public interface UsersMapper {
	public UsersVO loginCheck(UsersVO vo);
	public int modifyMember(UsersVO vo);
    public UsersVO getUser(String email);
    public List<Map<String, Object>> memberByDept();
}
