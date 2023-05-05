package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class CheckEmailControl implements Control {
	  @Override
	  public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String userId = req.getParameter("user_id");
	    UserService service = UserServiceImpl.getInstance();
	    boolean result = service.checkEmail(userId);

	    if (result) {
	      return "duplicate";
	    } else {
	      return "ok";
	    }
	  }
	}
