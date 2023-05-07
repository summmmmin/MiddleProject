<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">
    
  </head>
  <body>
<div class="site-section">
<c:set var = "no" value="0"></c:set>
<div class= container>
<h3>Q&A</h3>
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
			<a  class="page-link" href="qnaList.do?page=${pageInfo.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<a  class="page-link" class="${i == pageInfo.pageNum ? 'active' : '' }" href="qnaList.do?page=${i }">${i } </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a  class="page-link" href="qnaList.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
	<div class="d-flex justify-content-end">
		 <p><a href="addQna.do" class="btn btn-sm btn-primary" >Q&A 등록</a></p>
	</div>
</div>
</div>
</div>
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    </body>
</html>
  