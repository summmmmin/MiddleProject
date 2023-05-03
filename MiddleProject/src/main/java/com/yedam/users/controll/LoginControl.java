package com.yedam.users.controll;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class LoginControl implements Control {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			// MemberSerivce / MemberServiceImpl, MemberMapper.java(.xml)
			// service: MemberVO loginCheck(String id, String pw)
			// mapper: MemberVO loginCheck(MemberVO vo)
    	
    	
    	
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        MemberService service = MemberServiceImpl.getInstance();
        MemberVO vo = service.loginCheck(email, password);
        
        if (vo != null) {
            HttpSession session = req.getSession();    
            session.setAttribute("id", vo.getEmail());
            session.setAttribute("name", vo.getName());
            
            return "noticeList.do";
        } else {
            return "loginForm.do";
        }
    }
}

