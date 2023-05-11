<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
	.card {
		padding: 10px;
	}

	body {
		margin: 10px;
	}

	.btn {
		display: inline-block;
		vertical-align: middle;
	}
	
	#btn1{
	margin-left:13px;
	padding:10px;
	}
	
	#btn2{
	padding:11px 14px 11px 14px;
	}

	#login-buttons {
		display: flex;
		justify-content: center;
		margin-top: 10px;
		margin-right: 10px;
	}

	#login-buttons span {
		margin: 0 12px;
	}

	.form-input-error {
		border: 1px solid red;
	}
</style>

<div id="content" class="flex">
	<div class="">
		<div class="page-content page-container" id="page-content">
			<div class="padding">
				<div class="row justify-content-center">
					<div class="col-md-3">
						<div class="card">
							<div class="card-header">
								<strong>로그인</strong>
							</div>
							<div class="card-body">
								<form action="login.do" method="POST" onsubmit="return validateForm()">
									<div class="form-group">
										<label class="text-muted" for="exampleInputEmail1">아이디</label>
										<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="" name="user_id"> <small id="emailHelp" class="form-text text-muted">아이디는 이메일
											형식입니다</small>
									</div>
									<div class="form-group">
										<label class="text-muted" for="exampleInputPassword1">비밀번호</label>
										<input type="password" class="form-control" id="exampleInputPassword1" placeholder=""
											name="user_pw">
										<c:if test="${not empty message}">
											<p style="color: red; font-size: 12px;">${message}</p>
										</c:if>

									</div>
									<div id="login-buttons">
										<span><a href="signUpForm.do" class="btn btn-primary" id="btn1">회원가입</a></span>
										<span><button type="submit" class="btn btn-primary" id="btn2">로그인</button></span>
									</div>
								</form>
								<form style="text-align: center;">
									<div style="margin-top: 10px;">
										<a id="kakao-login-btn"></a> <a href="http://developers.kakao.com/logout"></a>
										<script type='text/javascript'>
											//<![CDATA[
											// 사용할 앱의 JavaScript 키
											Kakao
												.init('bad00d675e508815a17b7c361b884556');
											// 카카오 로그인 버튼생성
											Kakao.Auth
												.createLoginButton({
													container: '#kakao-login-btn',
													success: function (
														authObj) {
														alert(JSON
															.stringify(authObj));
													},
													fail: function (err) {
														alert(JSON
															.stringify(err));
													}
												});
											//]]>
										</script>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/login.js"></script>