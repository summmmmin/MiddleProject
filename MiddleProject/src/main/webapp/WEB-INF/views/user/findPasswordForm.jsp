<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="site-wrap">
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">FindPassword</strong>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="site-section">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-7">
				<div class="d-flex justify-content-center">
					<div class="p-3 p-lg-5 border">
						<div class="form-group row">
							<div class="col-md-12">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-12">
								<form method="post" action="findPassWordForm.do">
									<label for="user_pw" class="text-black"
										style="font-weight: bold; font-size: 15px;">회원 아이디</label>
									<input type="password" id="user_pw" name="user_inputpw"
										class="form-control" placeholder="아이디를 입력하세요" />
									<div class="mt-3">
										<input type="submit" value="확인"
											class="btn btn-primary py-2 px-4 text-white">
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
