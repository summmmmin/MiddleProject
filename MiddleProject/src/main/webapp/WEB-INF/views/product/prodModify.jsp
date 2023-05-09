<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class=container>
	<h3>상품내용 수정</h3>

	<form action="modifyProd.do" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
           		<th scope="col" class="text-primary">글번호</th>
            	<td><input type="text" name="pid" value="${prodInfo.pdtId}" readonly></td>
        	</tr>
			<tr>
				<th scope="col" class="text-primary">카테고리</th>
				<td>${prodInfo.catNm}</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">세부 카테고리</th>
				<td>${prodInfo.subcatNm}</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">상품 이름</th>
				<td><input type="text" name="pdtName" value="${prodInfo.pdtNm}"></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">상품 가격</th>
				<td><input type="text" name="price" value="${prodInfo.pdtPrice}">원</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">브랜드</th>
				<td>${prodInfo.brdNm}</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">성별</th>
				<td>${prodInfo.genderNm}</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">첨부파일</th>
				<td>
				 <c:if test="${prodInfo.pdtImg != null}">
				  <img width="200px" src="images/${prodInfo.pdtImg}">
				 </c:if>
				 <input type="file" name="img">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button class="btn btn-primary me-md-2" type="submit">저장</button>
					<button class="btn btn-primary me-md-2" type="button"
						onclick="location.href='prodList.do'">목차</button>
				</td>
			</tr>
		</table>
	</form>
</div>