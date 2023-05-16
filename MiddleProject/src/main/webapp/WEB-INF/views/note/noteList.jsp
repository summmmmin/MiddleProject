<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#td1 {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	max-width: 600px;
	display: inline-block;
}
</style>


<div class="site-section">
	<div class=container>
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
		<c:set var="no" value="0"></c:set>
		<h3>쪽지함</h3>
		<p>안 읽은 쪽지: ${readInfo }</p>
		<table class="table table-striped" style="width: 1000px;">
			<thead>
				<tr>
					<th scope="col" class="text-primary">No.</th>
					<th scope="col" class="text-primary">내용</th>
					<th scope="col" class="text-primary" style="width: 140px;">DATE</th>
					<th><button type="button"
							onclick="location.href='delAllNote.do?noteId=${userinfo.userId}&page=${pageInfo.pageNum}'"
							class="btn btn-danger btn-sm4">전체삭제</button></th>
				</tr>
			</thead>
			<c:forEach var="i" items="${noteList }">
				<c:choose>
					<c:when test="${i.noteViews > 0}">
						<tr style="opacity: 0.5;">
							<td><c:out value="${no=no+1 }"></c:out></td>
							<td class="d-inline-block text-truncate"
								style="max-width: 800px;"><a
								href="getNote.do?page=${pageInfo.pageNum}&noteId=${i.noteId }"
								class="td1 col-2 text-truncate">${i.noteCT }</a></td>
							<td>${i.noteDate}</td>
							<td><button type="button"
									onclick="location.href='delNote.do?noteId=${i.noteId}'"
									class="btn btn-danger btn-sm4">삭제</button></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td><c:out value="${no=no+1 }"></c:out></td>
							<td class="d-inline-block text-truncate"
								style="max-width: 800px;"><a
								href="getNote.do?page=${pageInfo.pageNum}&noteId=${i.noteId }"
								class="td1 col-2 text-truncate">${i.noteCT }</a></td>
							<td>${i.noteDate}</td>
							<td><button type="button"
									onclick="location.href='delNote.do?noteId=${i.noteId}'"
									class="btn btn-danger btn-sm4">삭제</button></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
		<div class="center">
			<div class="pagination justify-content-center">
				<c:if test="${pageInfo.prev }">
					<a class="page-link"
						href="noteList.do?page=${pageInfo.startPage-1 }">Previous</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage }">
					<a class="page-link"
						class="${i == pageInfo.pageNum ? 'active' : '' }"
						href="noteList.do?page=${i }">${i } </a>
				</c:forEach>
				<c:if test="${pageInfo.next }">
					<a class="page-link" href="noteList.do?page=${pageInfo.endPage+1 }">Next</a>
				</c:if>
			</div>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
