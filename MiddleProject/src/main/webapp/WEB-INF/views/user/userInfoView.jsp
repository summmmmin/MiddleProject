<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-wrap">
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">UserInfoPage</strong>
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
  <c:choose>
    <c:when test="${userinfo.userGrade == '관리자'}">
      <!-- 관리자 메뉴 -->
      <div style="color: red; font-weight: bold;">-- 관리자 메뉴 --</div>
      <a href="mypageView.do">내 정보 보기</a>
      <a href="userViewForm.do">유저정보 조회</a>
      <a href="sellList.do">판매내역 전체 조회</a>
      <a href="userSellForm.do">판매내역 단건 조회</a>
      <a href="buyList.do">구매내역 전체 조회</a>
      <a href="userBuyForm.do">구매내역 단건 조회</a>
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

            </div>
            <div class="row justify-content-md-center">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">${userInfo.userNm }님의 정보</h2>
                    <form action="#" method="post">
                        <div class="p-3 p-lg-5 border">
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="c_email" class="text-black">이름</label> <input type="text" class="form-control" id="name" name="name" value="${userInfo.userNm}" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label for="c_email" class="text-black">아이디</label> <input type="text" class="form-control" id="id" name="id" value="${userInfo.userId}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="c_email" class="text-black">전화번호</label> <input type="text" class="form-control" id="phone" name="phone" value="${userInfo.userPhone}" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label for="c_email" class="text-black">주소</label> <input type="text" class="form-control" id="address" name="address" value="${userInfo.userAdd}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="c_email" class="text-black">등급</label> <input type="text" class="form-control" id="grade" name="grade" value="${userInfo.userGrade}" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label for="c_email" class="text-black">포인트</label> <input type="text" class="form-control" id="points" name="points" value="${userInfo.userPoint}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="newPassword-toggle" class="text-black"></label> <input type="password" class="form-control" id="newPassword" name="newPassword" style="display: none;">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>