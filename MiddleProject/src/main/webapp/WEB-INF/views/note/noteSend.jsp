<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
	<div class="site-section">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col-md-7">
            <h2 class="h3 mb-3 text-black">쪽지보내기</h2>

			<form action="noteSend.do" method="post" enctype="multipart/form-data">
			 <div class="p-3 p-lg-5 border">
			<table class="table">
			<tr>
				<th scope="col" class="text-primary">제목</th>
				<td><input type="text" class="form-control" name="title"></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary" text-align="left">작성자</th>
			</tr>
			<tr>
				<th scope="col" class="text-primary">내용</th>
				<td> <textarea name="subject" cols="30" rows="15" class="form-control" placeholder="Write your notes here..."></textarea></td>
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