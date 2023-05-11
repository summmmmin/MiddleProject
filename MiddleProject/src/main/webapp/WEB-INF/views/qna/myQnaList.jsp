<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="site-section">
<c:set var = "no" value="0"></c:set>
<div class= container>
<h3>MY&nbsp&nbspQ&A리스트</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col" class ="text-primary" >No.</th>
      <th scope="col" class ="text-primary">제목</th>
      <th scope="col" class ="text-primary">작성자</th>
      <th scope="col" class ="text-primary">DATE</th>
    </tr>
  </thead>
  <c:forEach var="i" items="${myQna}">
    <tr>
		<td><c:out value="${i.postId }"></c:out></td>
		<td><a href="getQna.do?page=${pageInfo.pageNum}&postId=${i.postId }">${i.postTitle } </a></td>
		<td>${userinfo.userNm }</td>
		<td>${i.postDate }</td>
    </tr>
   </c:forEach>
</table>


<div class="center">
    <div class="pagination justify-content-center">
		<c:if test="${pageInfo.prev }">
			<a  class="page-link" href="myQna.do?page=${pageInfo.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<a  class="page-link" class="${i == pageInfo.pageNum ? 'active' : '' }" href="myQna.do?page=${i }">${i } </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a  class="page-link" href="myQna.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
</div>
</div>
</div>

  