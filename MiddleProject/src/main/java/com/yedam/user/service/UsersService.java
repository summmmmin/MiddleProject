package com.yedam.user.service;

import java.util.Map;

import com.yedam.user.domain.UsersVO;

public class UsersService {
    public UsersVO loginCheck(String userId, String userPw);
    
    public boolean modifyUser(UsersVO vo);
    
    public Map<String, Object> userByDept();
}
