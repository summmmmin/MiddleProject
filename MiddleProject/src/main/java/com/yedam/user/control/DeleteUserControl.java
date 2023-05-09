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

public class DeleteUserControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    UserVO user = (UserVO) session.getAttribute("userinfo");

	    UserService userService = UserServiceImpl.getInstance();
	    boolean result = userService.deleteUser(user);

	    if (result) {
	        session.invalidate();
	        return "user/deleteUser.tiles";
	    } else {
	        // 비밀번호가 일치하지 않으면 삭제 실패 메시지를 출력합니다.
	        req.setAttribute("message", "비밀번호가 일치하지 않습니다.");
	        return "user/deleteUserForm.tiles";
	    }
	}
}