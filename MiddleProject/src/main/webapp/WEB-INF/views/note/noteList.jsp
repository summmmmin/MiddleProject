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

  </head>
  <body>
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
  <c:forEach var="i" items="${notelist }">
    <tr>
		<td><c:out value="${no=no+1 }"></c:out></td>
		<td id= text1><a href=""  id=text>${i.noteCT }</a></td>
		<td>${i.noteDate}</td>
		<td><button type="button" onclick="location.href='delNote.do';"class="btn btn-danger btn-sm4">삭제</button></td>
    </tr>
   </c:forEach>
   <tr>
</table>
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
  