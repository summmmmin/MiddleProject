<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
String id = (String) session.getAttribute("userinfo.userId");

if (id == null) {
	response.sendRedirect("main.do");
}
%>

<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">Delete</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-7">
				<h2 class="h3 mb-3 text-black">회원탈퇴</h2>
				<form method="post" action="deleteUserForm.do">
					<div class="d-flex justify-content-center">
						<div class="p-3 p-lg-5 border">
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_email" class="text-black"
										style="font-weight: bold; font-size: 15px;">현재 사용자</label>
									<c:out value="${sessionScope.userinfo.userId}" />
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-9">
									<label for="newPassword-toggle" class="text-black">비밀번호
										확인</label> <input type="password" class="form-control" id="user_pw"
										name="newPassword" oninput="checkPasswordValidity2()">
									<div id="password-warning"></div>
								</div>
							</div>
							<div class="form-group row text-center">
								<div class="col-md-6 text-center mt-3">
									<button type="submit" class="btn btn-danger btn-lg btn-block">탈퇴</button>
								</div>
								<div class="col-md-6 text-center mt-3">
									<button type="button"
										class="btn btn-secondary btn-lg btn-block"
										onclick="history.back()">취소</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
