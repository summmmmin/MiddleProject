package com.yedam.user.service;

import java.util.List;

import com.yedam.user.domain.UserVO;

public interface UserService {
    public UserVO loginCheck(String UserId, String UserPw);
    public boolean addUser(UserVO user);
    boolean checkPassword(String userId, String password);
    public boolean deleteUser(UserVO user);
    public boolean modifyUser(UserVO user);
    public List<UserVO> users();
    public UserVO getUserInfo(String userId);
    public boolean kakaoSignUp(UserVO user);
    public boolean findPassword(String userId, String newPassword);
    public boolean updatePoint(UserVO user);
}