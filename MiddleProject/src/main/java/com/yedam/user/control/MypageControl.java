package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class MypageControl implements Control {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("userinfo");

        if(user == null) { // 로그인되어있지 않은 경우
            return "user/loginForm.tiles";
        }

        String view = "user/mypage_pw.tiles";
        request.getRequestDispatcher(view).forward(request, response);
        return null;
    }
}
