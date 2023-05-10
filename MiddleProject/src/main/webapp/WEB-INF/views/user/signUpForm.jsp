<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.form-input-error {
  border: 2px solid red;
}
</style>

	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Sign up</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col-md-7">
						<h2 class="h3 mb-3 text-black">회원가입</h2>

						<form action="signUp.do" method="post" onsubmit="return validateForm()">

							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_email" class="text-black">이메일 <span class="text-danger">*</span></label> <input
											type="email" class="form-control" id="user_id" name="user_id" placeholder="">
										<div id="email-duplicate-message" style="color: red;"></div>
									</div>
								</div>
								<!-- 
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_email2" class="text-black">이메일 인증번호 <span
											class="text-danger">*</span></label>
										<div class="input-group w-75">
											<input type="text" class="form-control" id="c_code"
												placeholder="인증번호" aria-label="Coupon Code"
												aria-describedby="button-addon2">
											<div class="input-group-append ">
												<button class="btn btn-primary btn-sm" type="button"
													id="button-addon2">인증번호 받기</button>
											</div>
										</div>
									</div>
								</div>
 -->
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_pw" class="text-black">비밀번호 <span class="text-danger">*</span></label> <input
											type="password" class="form-control" id="user_pw" name="user_pw" placeholder="최소 8자 이상이어야 합니다."
											required>
									</div>
									<div class="col-md-6">
										<label for="c_pw2" class="text-black">비밀번호 확인 <span class="text-danger">*</span></label> <input
											type="password" class="form-control" id="c_pw2" name="c_pw2" required>
									</div>
								</div>
								<div id="password-warning"></div>


								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_name" class="text-black">이름 </label> <input type="text" class="form-control"
											id="user_name" name="user_nm">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_addr" class="text-black">주소 </label> <input type="text" class="form-control"
											id="user_add" name="user_add">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_phone" class="text-black">전화번호 </label> <input type="text" class="form-control"
											id="user_phone" name="user_phone" onkeyup="formatPhoneNumber(this)" maxlength="13">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-12">
										<input type="submit" class="btn btn-primary btn-lg btn-block" value="가입 완료">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/custom.js"></script>
</body>