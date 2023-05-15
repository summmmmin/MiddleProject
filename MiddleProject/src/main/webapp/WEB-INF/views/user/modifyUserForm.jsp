<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-wrap">
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">ModifyInfo</strong>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="sidebar">
					<a href="mypageView.do">내 정보 보기</a> <a href="wishList.do">관심상품</a>
					<a href="#">구매내역</a> <a href="#">판매내역</a> <a href="myQna.do">나의 Q&A</a> <a
						href="noteList.do">받은 쪽지함</a> <a href="#">나의 리뷰</a>
					<c:if test="${userinfo.userGrade == '관리자'}">
						<a href="sendNote.do">쪽지보내기</a>
					</c:if>
				</div>
			</div>
			<div class="row justify-content-md-center">
				<div class="col-md-12">
					<h2 class="h3 mb-3 text-black">회원정보 변경</h2>

					<form action="modifyUser.do" method="post"
						onsubmit="return checkPasswordValidity()">
						<div class="p-3 p-lg-5 border">
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_email" class="text-black">이름</label> <input
										type="text" class="form-control" id="user_nm" name="name"
										value="${userinfo.userNm}" readonly>
								</div>
								<div class="col-md-6">
									<label for="c_email" class="text-black">아이디</label> <input
										type="text" class="form-control" id="user_id" name="id"
										value="${userinfo.userId}" readonly>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_email" class="text-black">전화번호</label> <input
										type="text" class="form-control" id="user_phone"
										name="newPhone" value="${userinfo.userPhone}" maxlength="13"
										oninput="formatPhoneNumber(this)">
								</div>
								<div class="col-md-6">
									<label for="c_email" class="text-black">주소</label> <input
										type="text" class="form-control" id="user_add" name="newAdd"
										value="${userinfo.userAdd}">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_email" class="text-black">등급</label> <input
										type="text" class="form-control" id="user_grade" name="grade"
										value="${userinfo.userGrade}" readonly>
								</div>
								<div class="col-md-6">
									<label for="c_email" class="text-black">포인트</label> <input
										type="text" class="form-control" id="user_point" name="points"
										value="${userinfo.userPoint}" readonly>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="newPassword-toggle" class="text-black">비밀번호
										변경</label> <input type="password" class="form-control" id="user_pw"
										name="newPassword" oninput="checkPasswordValidity2()">
									<div id="password-warning"></div>
								</div>
							</div>
							<div class="form-group row text-center">
								<div class="col-md-6 text-center mt-3">
									<input type="submit" class="btn btn-success btn-lg btn-block"
										value="완료">
								</div>
								<div class="col-md-6 text-center mt-3">
									<a href="javascript:history.back();"
										class="btn btn-secondary btn-lg btn-block">취소</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="js/modifyuser.js"></script>