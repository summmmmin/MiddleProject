package com.yedam.user.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class UserListControl implements Control {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("application/json;charset=utf-8"); // json 형태로 응답을 보낼 것이므로 Content-Type 설정
		
		UserService userService = new UserServiceImpl();
		List<UserVO> userList = userService.users();

		// UserVO 리스트(유저정보) .json으로
		Gson gson = new Gson();
		String json = gson.toJson(userList);

		req.setAttribute("userList", json);
		resp.getWriter().write(json);
		return json + ".json";
	}
}