<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
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
<div class="site-wrap">
	<div class="site-section">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col-md-7">
            <h2 class="h3 mb-3 text-black">Q&A 등록</h2>

			<form action="qnaAdd.do?userId=${userinfo.userId }" method="post" enctype="multipart/form-data">
			 <div class="p-3 p-lg-5 border">
			<table class="table">
			<tr>
				<th scope="col" class="text-primary">제목</th>
				<td><input type="text" class="form-control" name="title"></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">작성자</th>
				<td><span class="input-group-text" padding-right="5px" name = "writer">${userinfo.userNm }</span></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">내용</th>
				<td> <textarea name="subject" cols="30" rows="15" class="form-control" placeholder="Write your notes here..."></textarea></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">첨부파일</th>
				<td><input type="file" name="img"></td>
			</tr>
			</table>
            		<div class="d-flex justify-content-end">
					<button type="submit"class="btn btn-outline-primary btn-sm">등록</button>
					<button class="btn btn-outline-dark btn-sm "><a href="qnaList.do">목차</a></button></button>
					</div>
			</div>
			</form>
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