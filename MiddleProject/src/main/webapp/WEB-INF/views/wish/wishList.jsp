<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-wrap">
    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">wishList</strong>
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
            <div class="col-md-9">
                <div class="row mb-5">
                    <h2 class="h3 mb-4 text-black">${userinfo.userNm }님의 관심상품</h2>
                    <form class="col-md-12" method="post">
                        <div class="site-blocks-table">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">상품 이미지</th>
                                        <th class="product-name">상품명</th>
                                        <th class="product-price">가격</th>
                                        <th class="product-remove">삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${isEmpty}">
                                            <tr>
                                                <td colspan="4">관심상품이 비어있습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="item" items="${wishlist}">
                                                <tr>
                                                    <td class="product-thumbnail"><a href="getProd.do?pid=${item.pdtId}"> <img src="${item.pdtImg}" alt="Image" class="img-fluid">
                                                        </a></td>
                                                    <td class="product-name">
                                                        <h2 class="h5 text-black">
                                                            <a href="getProd.do?&pid=${item.pdtId}">
                                                                ${item.pdtNm} </a>
                                                        </h2>

                                                    </td>
                                                    <td class="product-price"><span class="text-black">${item.pdtPrice}원</span>
                                                    </td>
                                                    <td><a href="#" class="btn btn-primary btn-sm delete-btn" data-wishId="${item.wishId}">X</a></td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/DeleteWishList.js"></script>