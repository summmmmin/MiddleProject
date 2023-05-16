package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;

public class UserViewFormControl implements Control {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserVO user = (UserVO) session.getAttribute("userinfo");
        
        // 사용자가 로그인하지 않은 경우 또는 관리자가 아닌 경우 접근 차단
        if (user == null || !user.getUserGrade().equals("관리자")) {
            return "user/accessDenied.tiles"; // 접근이 차단된 페이지로 이동
        }
        return "user/userViewForm.tiles"; // 관리자 페이지로 이동
    }
}
