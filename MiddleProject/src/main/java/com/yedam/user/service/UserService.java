package com.yedam.user.service;

import com.yedam.user.domain.UserVO;

public interface UserService {
    public UserVO loginCheck(String UserId, String UserPw);
    public boolean addUser(UserVO user);

}
