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
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">Q&A</h2>
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
				<td scope="col" class="text-primary">첨부파일</td>
				<td colspan="2" > <img src="images/${qnaInfo.qnaImg }" alt="Image" class="img-fluid" style="width:200px;  height:200px;"></td>

			</tr>
			<tr>
				<td scope="col" class="text-primary">내용</td>
				<td colspan="2" style="min-height:200px;">${qnaInfo.postCT }</td>
			</tr>
			</table>
            		<div class="d-flex justify-content-end">
            		<c:if test ="${userinfo.userId == qnaInfo.userId }">
					<button type="button" onclick="location.href='delQna.do?postId=${qnaInfo.postId}'"class="btn btn-danger btn-sm">삭제</button>
					</c:if>
					<button class="btn btn-outline-dark btn-sm "><a href="qnaList.do">목차</a></button>				
					</div>
			</div>
            </div>
            </div>
          <hr>
      <div class="p-3 p-lg-5 border" style="margin-top:20px">
     	<p><strong class="text-primary h4">답변</strong></p>
        <div class="border p-3 mb-5">
          <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">관리자</a></h3>
            <div class="collapse" id="collapsepaypal">
              <div class="py-2">
			<c:choose> 
			<c:when test="${userinfo.userGrade=='일반회원' }">
				<c:choose>
				<c:when test="${commentInfo.commentCT == null}">
				<p class="mb-0">답변을 작성중입니다.조금만 기다려주세요</p>
				</c:when>
				<c:otherwise>
			 	<p class="mb-0">${commentInfo.commentCT }</p>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${userinfo.userGrade=='관리자' }">
                 <c:choose>
				 <c:when test="${commentInfo.commentCT == null}">
                 <textarea id=comment style="width:980px;height:200px;" >답변을 작성해주세요</textarea>
          		 </c:when>
				 <c:otherwise>
				 <textarea id=comment1 style="width:980px;height:200px;" >${commentInfo.commentCT }</textarea>
              	 </c:otherwise>
              	 </c:choose>
             </c:when>
           	</c:choose>
              </div>
           </div>           
                <div class="d-flex justify-content-end">
            		<c:if test ="${userinfo.userGrade=='관리자' }">
            		<c:choose>
						<c:when test="${commentInfo.commentCT == null}">
						<button type="button" id="addComment" class="btn btn-danger btn-sm">답변달기</button>
						</c:when>
						<c:otherwise>
						<button type="button" id="modifyComment" class="btn btn-danger btn-sm">수정</button>	
						</c:otherwise>
					</c:choose>
					</c:if>

       	</div>
       </div>
      </div>
     </div>    
    </div>
    
    
<script>
    document.querySelector("#addComment").addEventListener('click', addCommentFnc);
    function addCommentFnc(e){
    	
    let comment= document.querySelector("#comment").value;	
    }
    
    let xhtp = new XMLHttpRequest();
    xhtp.open('post','addQC.do');
    xhtp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    xhtp.send('postId=${postId}&comment=' + comment;);
    

    
    </script> 
    
    
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