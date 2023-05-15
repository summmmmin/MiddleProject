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

public class UserViewControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserVO user = (UserVO) session.getAttribute("userinfo");
        
        if (user == null || !user.getUserGrade().equals("관리자")) {
            return "user/accessDenied.tiles";
        }
        
        String userId = req.getParameter("userId"); // 입력받은 특정 유저의 아이디
        
        UserService userService = new UserServiceImpl();
        UserVO userInfo = userService.getUserInfo(userId);
        
        if (userInfo == null) {
            // 유저 정보가 없을 경우, 에러 처리 또는 다른 처리 로직을 추가해야 합니다.
            return "errorPage.do";
        }
        
        req.setAttribute("userInfo", userInfo);
        return "mypageView.do"; // 관리자용 마이페이지 조회 페이지로 이동
    }
}