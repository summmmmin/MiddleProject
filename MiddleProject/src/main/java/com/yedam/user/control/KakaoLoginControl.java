package com.yedam.user.control;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.yedam.common.Control;
import com.yedam.user.domain.UserVO;
import com.yedam.user.service.UserService;
import com.yedam.user.service.UserServiceImpl;

public class KakaoLoginControl implements Control {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		StringBuilder builder = new StringBuilder();
		BufferedReader reader = request.getReader();
		String line;

		while ((line = reader.readLine()) != null) {
			builder.append(line);
		}

		Gson gson = new Gson();
		JsonElement jsonElement = gson.fromJson(builder.toString(), JsonElement.class);
		JsonObject jsonData = jsonElement.getAsJsonObject();
		String userId = jsonData.get("email").getAsString();
		String userNm = jsonData.get("nickname").getAsString();

		// 회원이 있는지 검사, 없으면 회원가입부터 진행 후 로그인
		UserService userService = new UserServiceImpl();
		UserVO user = userService.getUserInfo(userId);

		System.out.println(user);
		System.out.println(userId);

		if (user == null) {
			// 회원가입이 필요
			UserVO newUser = new UserVO();
			newUser.setUserId(userId);
			// 비밀번호는 not null이라 임시로 test부여
			newUser.setUserPw("test");
			// 다른 데이터도 마찬가지
			newUser.setUserNm(userNm);
			newUser.setUserPhone("123-1234-1234");
			newUser.setUserAdd("카카오 유저입니다.");

			// 카카오 자동 회원가입 로직 실행
			boolean isSuccess = userService.kakaoSignUp(newUser);

			response.setContentType("application/json;charset=utf-8");

			if (isSuccess) {
				// 회원가입 했으니 로그인까지 자동으로 이어지게 하기
				System.out.println("카카오 회원가입 완료");
				UserVO kakaoUser = userService.loginCheck(userId, userNm);

				session = request.getSession();
				session.setAttribute("userinfo", kakaoUser);

				// 카카오 로그인 플래그 설정
				session.setAttribute("kakaoUser", true);

				return gson + ".json";

			} else {

				System.out.println("회원가입 에러");
				return "user/loginForm.tiles";
			}

		} else {
			// 이미 계정이 있는 회원
			System.out.println("이미 가입한 회원입니다");
			session.setAttribute("userinfo", user);
			response.getWriter().append("main.do");
		}
		return "main.do";
	}
}
