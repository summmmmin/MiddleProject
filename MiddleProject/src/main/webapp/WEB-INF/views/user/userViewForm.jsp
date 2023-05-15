<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="site-wrap">
	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">AdminPage</strong>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="site-section">
<div class="sidebar">
  <c:choose>
    <c:when test="${userinfo.userGrade == '관리자'}">
      <!-- 관리자 메뉴 -->
      <div style="color: red; font-weight: bold;">-- 관리자 메뉴 --</div>
      <a href="userViewForm.do">유저정보 조회</a>
      <a href="sellList.do">판매내역 조회</a>
      <a href="buyList.do">구매내역 조회</a>
      <a href="sendNote.do">쪽지보내기</a>
    </c:when>
    <c:otherwise>
      <!-- 일반 사용자 메뉴 -->
      <a href="mypageView.do">내 정보 보기</a>
      <a href="wishList.do">관심상품</a>
      <a href="sellListU.do">나의 판매내역</a>
      <a href="buyListU.do">나의 구매내역</a>
      <a href="myQna.do">나의 Q&A</a>
      <a href="noteList.do">받은 쪽지함</a>
      <a href="myReview.do">나의 리뷰</a>
    </c:otherwise>
  </c:choose>
</div>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-7">
				<div class="d-flex justify-content-center">
					<div class="p-3 p-lg-5 border">
						<div class="form-group row">
							<div class="col-md-12"></div>
						</div>
						<div class="form-group row">
							<div class="col-md-12">
								<form method="post" action="userView.do">
									<label for="user_id" class="text-black"
										style="font-weight: bold; font-size: 15px;">회원 아이디</label> <input
										type="email" id="user_id" name="user_id" class="form-control"
										placeholder="아이디를 입력하세요" />
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
