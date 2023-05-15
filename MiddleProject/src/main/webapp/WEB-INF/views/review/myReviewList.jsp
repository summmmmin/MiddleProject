<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="site-section">
	<div class=container>
		<div class="col-md-3">
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
		</div>
		<h3>내가 쓴 리뷰</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" class="text-primary">No</th>
					<th scope="col" class="text-primary">제목</th>
					<th scope="col" class="text-primary">구매상품</th>
					<th scope="col" class="text-primary">작성자</th>
					<th scope="col" class="text-primary">DATE</th>
				</tr>
			</thead>
			<c:forEach var="i" items="${myReview}">
				<tr>
					<td><c:out value="${i.reviewId}"></c:out></td>
					<td><a href="getReview.do?rid=${i.reviewId}">${i.reviewTitle}</a></td>
					<td>${i.pdtNm}</td>
					<td>${userinfo.userNm}</td>
					<td>${i.reviewDate}</td>
					<td><button type="button"
							onclick="location.href='delReview.do?rid=${i.reviewId}'"
							class="btn btn-danger btn-sm4">삭제</button></td>
				</tr>
			</c:forEach>
		</table>

		<div class="center">
			<div class="pagination justify-content-center">
				<c:if test="${pageInfo.prev}">
					<a class="page-link"
						href="myReview.do?page=${pageInfo.startPage-1}">Previous</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage}">
					<a class="page-link"
						class="${i == pageInfo.pageNum ? 'active' : ''}"
						href="myReview.do?page=${i}">${i} </a>
				</c:forEach>
				<c:if test="${pageInfo.next}">
					<a class="page-link" href="myReview.do?page=${pageInfo.endPage+1}">Next</a>
				</c:if>
			</div>
		</div>
	</div>
</div>