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

public class ModifyUserControl implements Control {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        UserVO user = (UserVO) session.getAttribute("userinfo");

        String userPw = req.getParameter("newPassword");
        String userPhone = req.getParameter("newPhone");
        String userAdd = req.getParameter("newAdd");

        UserService service = UserServiceImpl.getInstance();

        user.setUserPw(userPw);
        user.setUserPhone(userPhone);
        user.setUserAdd(userAdd);

        System.out.println(user);
        
        boolean result = service.modifyUser(user);


        System.out.println("-----------------------로그 구분용-----------------------------");

        if (result) {
            session.setAttribute("userinfo", user);
            return "mypageView.do";
        } else {
            req.setAttribute("userinfo", user);
            return "modifyUserForm.do";
        }
    }
}
