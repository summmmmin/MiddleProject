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
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="${qnaInfo.postImg }" alt="Image" class="img-fluid">
          </div>
          <div class="col-md-6">
            <h2 class="text-black">${qnaInfo.postTitle }</h2>
            <p><strong class="text-primary h1">${qnaInfo.userNm }</strong></p>
            <p class="mb-4">${qnaInfo.postCT }</p>
          
            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 120px;">
            </div>

            </div>
            <div class="mb-5">
              <button class="btn btn-primary btn-sm">수정</button>
             <button  class="btn btn-primary btn-danger btn-lg " >삭제</button>
  			  <button class="btn btn-outline-secondary btn-lg"><a href="qnaList.do">목차</a></button></button>
            </div>
          </div>
        </div>
      <div class="p-3 p-lg-5 border">
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