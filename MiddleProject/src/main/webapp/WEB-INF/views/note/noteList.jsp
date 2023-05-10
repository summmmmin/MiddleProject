<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#text{
}
#text1{
width:100px;
text-overflow:eclipsis; 
overflow:hidden; 
white-space:no-wrap;
display:inline-block

}
</style>
<div class="site-section">
<div class= container>
<c:set var = "no" value="0"></c:set>
<h3>쪽지함</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col" class ="text-primary" >No.</th>
      <th scope="col" class ="text-primary">내용</th>
      <th scope="col" class ="text-primary">DATE</th>
      <th><button type="button" onclick=""class="btn btn-danger btn-sm4">전체삭제</button></th>
    </tr>
  </thead>
  <tbody id ="list"></tbody>
</table>
</div>
</div>
<script>
</script>
  <c:forEach var="i" items="${notelist }">
    <tr>
		<td><c:out value="${no=no+1 }"></c:out></td>
		<td id= text1><a href=""  id=text>${i.noteCT }</a></td>
		<td>${i.noteDate}</td>
		<td><button type="button" onclick="location.href='delNote.do';"class="btn btn-danger btn-sm4">삭제</button></td>
    </tr>
   </c:forEach>
   <tr>
  