package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class MypageControl implements Control {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("userinfo");
        
        if(user == null) { // 로그인되어있지 않은 경우
            return "user/loginForm.tiles";
        }

        String userPw = request.getParameter("user_pw");

        // 입력한 비밀번호가 맞는지 확인
        UserService userService = UserServiceImpl.getInstance();
        UserVO inputUser = (UserVO) session.getAttribute("userinfo");
        String userId = inputUser.getUserId();
        boolean result = userService.checkPassword(userId, userPw);

        if(result) { // 비밀번호가 일치하는 경우
            return "user/mypageView.tiles";
        } else { // 비밀번호가 일치하지 않는 경우
            request.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
            return "user/mypagePw.tiles";
        }
    }
}

