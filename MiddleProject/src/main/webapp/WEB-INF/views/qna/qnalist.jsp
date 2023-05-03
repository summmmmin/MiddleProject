<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="site-section">
<c:set var = "no" value="10"></c:set>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">No.</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">DATE</th>
    </tr>
  </thead>
  <c:forEach var="qna" items="${list }">
    <tr>
		<td><c:out value="${no=no+1 }"></c:out></td>
		<td><a href="getQna.do?page=${pageInfo.pageNum}&nid=${qna.qid }">${qna.qid }</a></td>
		<td>${qna.qTitle }</td>
		<td>${qna.UId }</td>
		<td>${qna.qDate }</td>
    </tr>
   </c:forEach>
</table>


<div class="center">
    <div class="pagination">
		<c:if test="${pageInfo.prev }">
			<a href="noticeList.do?page=${pageInfo.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="noticeList.do?page=${i }">${i } </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a href="List.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
</div>
</div>