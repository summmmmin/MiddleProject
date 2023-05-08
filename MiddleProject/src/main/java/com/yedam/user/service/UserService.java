package com.yedam.user.service;

import javax.servlet.http.HttpServletRequest;


import com.yedam.user.domain.UserVO;

public interface UserService {
    public UserVO loginCheck(String UserId, String UserPw);
    public boolean addUser(UserVO user);
    public boolean checkPassword(String userPw, HttpServletRequest request);
    public boolean deleteUser(UserVO user);

}
