<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-wrap">
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">Mypage</strong>
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
					<h2 class="h3 mb-3 text-black">${userinfo.userNm }님의정보</h2>

					<form action="mypageView.do" method="post">
						<div class="p-3 p-lg-5 border">
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_email" class="text-black">이름</label> <input
										type="text" class="form-control" id="name" name="name"
										value="${userinfo.userNm}" readonly>
								</div>
								<div class="col-md-6">
									<label for="c_email" class="text-black">아이디</label> <input
										type="text" class="form-control" id="id" name="id"
										value="${userinfo.userId}" readonly>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_email" class="text-black">전화번호</label> <input
										type="text" class="form-control" id="phone" name="phone"
										value="${userinfo.userPhone}" readonly>
								</div>
								<div class="col-md-6">
									<label for="c_email" class="text-black">주소</label> <input
										type="text" class="form-control" id="address" name="address"
										value="${userinfo.userAdd}" readonly>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_email" class="text-black">등급</label> <input
										type="text" class="form-control" id="grade" name="grade"
										value="${userinfo.userGrade}" readonly>
								</div>
								<div class="col-md-6">
									<label for="c_email" class="text-black">포인트</label> <input
										type="text" class="form-control" id="points" name="points"
										value="${userinfo.userPoint}" readonly>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<label for="newPassword-toggle" class="text-black"></label> <input
										type="password" class="form-control" id="newPassword"
										name="newPassword" style="display: none;">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-6">
									<input type="button" class="btn btn-primary btn-lg btn-block"
										value="수정" onclick="location.href='modifyUserForm.do'">
								</div>
								<div class="col-md-6">
									<input type="button" class="btn btn-danger btn-lg btn-block"
										value="탈퇴" onclick="location.href='deleteUserForm.do'">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>