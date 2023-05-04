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
        try {
            String UserId = req.getParameter("UserId");
            String UserPw = req.getParameter("UserPw");
            
            System.out.println(UserId);
            System.out.println(UserPw);

            UserService service = UserServiceImpl.getInstance();
            UserVO vo = service.loginCheck(UserId, UserPw);

            System.out.println(vo);
            
            if (vo != null) {
                HttpSession session = req.getSession();    
                session.setAttribute("UserId", vo.getUserId());		//세션에 id저장
                session.setAttribute("UserNm", vo.getUserNm());		//세션에 이름저장 (환영메세지 보낼거라면 출력)
                
                return "main.do";
            } else {
                req.setAttribute("errorMessage", "아이디나 비밀번호가 틀렸습니다");
                return "loginForm.do";
            }
        } catch (Exception e) {
            req.setAttribute("errorMessage", "로그인 처리 중 오류가 발생했습니다.");
            return "loginForm.do";
        }
    }
}
