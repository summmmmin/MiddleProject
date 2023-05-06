<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
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
<div class="site-wrap">
	<div class="site-section">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col-md-7">
            <h2 class="h3 mb-3 text-black">Q&A</h2>
          		<form action="qnaAdd.do" method="post" enctype="multipart/form-data">
          	<div class="p-3 p-lg-5 border">
			<table class="table " style="text-align: center; border:1px solid #dddddd">
			<tr>
				<td scope="col" style="width: 20%;"  class="text-primary">제목</td>
				<td colspan="2">${qnaInfo.postTitle }</td>
			</tr>
			<tr>
				<td scope="col" class="text-primary">작성자</td>
				<td colspan="2">${qnaInfo.userNm }</td>
			</tr>
			<tr>
				<td scope="col" class="text-primary">내용</td>
				<td colspan="2" style="min-height:200px;">${qnaInfo.postCT }</td>
			</tr>
			<tr>
				<td scope="col" class="text-primary">첨부파일</td>
				<td "colspan="2" > <img src="${fileType }" alt="Image" class="img-fluid"></td>
				<td><c:if test="${qnaInfo.postImg != null}">
					<c:choose>
						<c:when test="${fileType == 'image' }">
							<img width="200px" src="images/${qnaInfo.postImg }">
						</c:when>
						<c:otherwise>
							<a href="images/${qnaInfo.postImg }">${qnaInfo.postImg }</a>
						</c:otherwise>
					</c:choose>
				</c:if></td>
			</tr>
			</table>
            		<div class="d-flex justify-content-end">
					<button type="button" onclick="location.href='delQna.do?postId=${qnaInfo.postId}'"class="btn btn-danger btn-sm">삭제</button>
					<button class="btn btn-outline-dark btn-sm "><a href="qnaList.do">목차</a></button>
					</div>
			</div>
            </div>
            </div>
      <div class="p-3 p-lg-5 border" style="margin-top:20px">
      <p><strong class="text-primary h4">답변</strong></p>
        <div class="border p-3 mb-5">
          <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">관리자</a></h3>

            <div class="collapse" id="collapsepaypal">
              <div class="py-2">
                  <p class="mb-0">구라치지마십쇼</p>
              </div>
           </div>
       	</div>
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