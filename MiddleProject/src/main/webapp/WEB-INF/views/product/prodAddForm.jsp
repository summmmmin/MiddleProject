<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class=container>
	<h3>상품 등록</h3>

	<form action="addProd.do" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th scope="col" class="text-primary">카테고리</th>
				<td>
					<div class="form-row align-items-center">
						<div class="col-auto my-1">
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>선택하세요</option>
								<c:forEach var="categories" items="${list}" begin="1"
									end="2">
									<option value="${categories.catId}">${categories.catNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">세부 카테고리</th>
				<td>
					<div class="form-row align-items-center">
						<div class="col-auto my-1">
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>선택하세요</option>
								<c:forEach var="categories" items="${list}" begin="1"
									end="${product.pdtId}">
									<option value="${product.subcatId}">${product.subcatId}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">상품 이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">상품 가격</th>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">브랜드</th>
				<td>
					<div class="form-row align-items-center">
						<div class="col-auto my-1">
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>선택하세요</option>
								<c:forEach var="product" items="${list}" begin="1"
									end="${product.pdtId}">
									<option value="${product.pdtBrand}">${product.pdtBrand}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">첨부파일</th>
				<td><input type="file" name="img"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="btn btn-primary me-md-2" type="submit"
						onclick="location.href='prodAddForm.do'">등록</button>
					<button class="btn btn-primary me-md-2" type="reset">삭제</button>
				</td>
			</tr>
		</table>
	</form>
</div>