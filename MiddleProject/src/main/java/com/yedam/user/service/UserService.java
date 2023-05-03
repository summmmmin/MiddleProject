package com.yedam.user.service;

import com.yedam.user.domain.UserVO;

public interface UserService {
    public UserVO loginCheck(String userId, String userPw);

}
