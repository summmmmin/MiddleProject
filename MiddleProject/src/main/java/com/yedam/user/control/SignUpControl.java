package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class SignUpControl implements Control {
    private UserService userService = new UserServiceImpl();

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("user_id");
        String userPw = req.getParameter("user_pw");
        String userNm = req.getParameter("user_nm");
        String userPhone = req.getParameter("user_phone");
        String userAdd = req.getParameter("user_add");

        UserVO user = new UserVO();
        user.setUserId(userId);
        user.setUserPw(userPw);
        user.setUserNm(userNm);
        user.setUserPhone(userPhone);
        user.setUserAdd(userAdd);
        
        // 아이디 중복 체크
        boolean isDuplicate = userService.getUserInfo(userId) != null;
        if (isDuplicate) {
            req.setAttribute("errorMessage", "이미 존재하는 아이디입니다.");
            req.setAttribute("user", user); // 입력한 사용자 정보를 다시 저장
            return "user/signUpForm.tiles";
        }
        
        System.out.println(user);

        boolean isSuccess = userService.addUser(user);

        if (isSuccess) {
            return "main.do";
        } else {
            return "user/signUp.tiles";
        }
    }
}