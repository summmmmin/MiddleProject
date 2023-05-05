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

            String UserId = req.getParameter("user_id");
            String UserPw = req.getParameter("user_pw");
            
            System.out.println(UserId);
            System.out.println(UserPw);

            UserService service = UserServiceImpl.getInstance();
            UserVO vo = service.loginCheck(UserId, UserPw);

            System.out.println(vo);
            
            if (vo != null) {
                HttpSession session = req.getSession();    
                session.setAttribute("userinfo", vo);
                
                
                return "main.do";
            } else {
                return "loginForm.do";
            }
        }
    }
