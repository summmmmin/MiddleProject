package com.yedam.user.controll;

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
    	
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserService service = UserServiceImpl.getInstance();
        UserVO vo = service.loginCheck(email, password);
        
        if (vo != null) {
            HttpSession session = req.getSession();    
            session.setAttribute("id", vo.getUserId());
            
            return "main.do";
        } else {
            return "loginForm.do";
        }
    }
}

