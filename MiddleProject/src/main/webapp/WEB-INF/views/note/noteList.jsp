<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
 #ss{
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

</style>


<div class="site-section">
<div class= container>
<c:set var = "no" value="0"></c:set>
<h3>쪽지함</h3>
<table class="table table-striped" style="width:1000px;">
  <thead>
    <tr>
      <th scope="col" class ="text-primary" >No.</th>
      <th scope="col" class ="text-primary">내용</th>
      <th  scope="col" class ="text-primary" style="width:140px;">DATE</th>
      <th><button type="button" onclick="delALL()" class="btn btn-danger btn-sm4">전체삭제</button></th>
    </tr>
  </thead>
   <c:forEach var="i" items="${noteList }">
  <c:choose>
  <c:when test ="${i.noteView > 1}">
    <tr style="opacity:0.7;">
		<td ><c:out value="${no=no+1 }"></c:out></td>
		<td class="td1"><a href="getNote.do?page=${pageInfo.pageNum}&noteId=${i.noteId }"  id=text>${i.noteCT }</a></td>
		<td class="td1">${i.noteDate}</td>
		<td><button type="button" onclick="location.href='delNote.do?noteId=${i.noteId}'" class="btn btn-danger btn-sm4">삭제</button></td>
    </tr>
   </c:when>
   <c:otherwise>
    <tr>
		<td ><c:out value="${no=no+1 }"></c:out></td>
		<td class="td1"><a href="getNote.do?page=${pageInfo.pageNum}&noteId=${i.noteId }"  id=text>${i.noteCT }</a></td>
		<td class="td1">${i.noteDate}</td>
		<td><button type="button" onclick="location.href='delNote.do?noteId=${i.noteId}'"class="btn btn-danger btn-sm4">삭제</button></td>
    </tr>
   </c:otherwise>
   </c:choose>
   </c:forEach>
</table>	
<div class="center">
    <div class="pagination justify-content-center">
		<c:if test="${pageInfo.prev }">
			<a  class="page-link" href="noteList.do?page=${pageInfo.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<a  class="page-link" class="${i == pageInfo.pageNum ? 'active' : '' }" href="noteList.do?page=${i }">${i } </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a  class="page-link" href="noteList.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
</div>
</div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  