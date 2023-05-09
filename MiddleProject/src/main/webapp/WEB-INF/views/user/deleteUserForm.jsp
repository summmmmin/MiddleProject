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
				<h2 class="d-flex justify-content-center text-black">회원 탈퇴</h2>
					<form method="post" action="deleteUserForm.do">
						<div class="d-flex justify-content-center">
							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_email" class="text-black"
											style="font-weight: bold; font-size: 15px;">현재 사용자</label>
										<div id="email-duplicate-message" style="color: black;">
											<c:out value="${sessionScope.userinfo.userId}" />
										</div>
									</div>
								</div>
								<input type="password" id="user_pw" name="user_pw"
									placeholder="현재 비밀번호를 입력하세요" /> <input type="submit"
									value="탈퇴" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
