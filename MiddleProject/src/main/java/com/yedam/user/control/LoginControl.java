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

public class LoginControl implements Control {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("user_id");
        String userPw = req.getParameter("user_pw");

        UserService service = UserServiceImpl.getInstance();
        UserVO vo = service.loginCheck(userId, userPw);

        System.out.println(vo);
        
        if (vo != null) {
            HttpSession session = req.getSession();    
            session.setAttribute("userinfo", vo);

            // 이전 URL이 저장된 세션 변수를 가져옴
            String returnUrl = (String) session.getAttribute("returnUrl");

            if (returnUrl != null) {
                // 이전 URL이 저장된 세션 변수가 있으면 해당 URL로 이동
                session.removeAttribute("returnUrl"); // 이전 URL 세션 변수 제거
                resp.sendRedirect(returnUrl);
                return returnUrl; // returnUrl 반환
            } else {
                // 이전 URL이 저장된 세션 변수가 없으면 메인 페이지로 이동
                return "main.do";
            }
        } else {
            return "loginForm.do";
        }
    }
}