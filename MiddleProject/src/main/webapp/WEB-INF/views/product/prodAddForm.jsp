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
							<select class="form-control" name="catId" onchange="cat()">
								<option selected disabled value="">선택하세요</option>
								<c:forEach var="categories" items="${list}">
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
							<select class="form-control" name="subcatId">
								<option selected disabled value="">선택하세요</option>
								<c:choose>
									<c:when test='${catid == 1}'>
										<c:forEach var="sub_category" items="${list2}">
											<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
										</c:forEach>
									</c:when>
									<c:when test='${catid == 2}'>
										<c:forEach var="sub_category" items="${list2}">
											<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
										</c:forEach>
									</c:when>
									<c:when test='${catid == 3}'>
										<c:forEach var="sub_category" items="${list2}">
											<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach var="sub_category" items="${list2}">
											<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">상품 이름</th>
				<td><input type="text" name="pdtName"></td>
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
							<select class="form-control" name="brdId">
								<option selected disabled value="">선택하세요</option>
								<c:forEach var="brand" items="${list3}">
									<option value="${brand.brdId}">${brand.brdNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">성별</th>
				<td>
					<div class="form-row align-items-center">
						<div class="col-auto my-1">
							<select class="form-control" name="genderId">
								<option selected disabled value="">선택하세요</option>
								<c:forEach var="gender" items="${list4}">
									<option value="${gender.genderId}">${gender.genderNm}</option>
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
				<td colspan="2" align="right">
					<button class="btn btn-primary me-md-2" type="submit"
						onclick="location.href='prodAddForm.do'">등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<script>
function cat() {
	let cat = document.getElementById("catId");
	document.getElementById("subcatId");
	
	if (cat.value == 1) {
		innerHTML
	}
}

<c:choose>
<c:when test='${catid == 1}'>
	<c:forEach var="sub_category" items="${list2}">
		<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
	</c:forEach>
</c:when>
<c:when test='${catid == 2}'>
	<c:forEach var="sub_category" items="${list2}">
		<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
	</c:forEach>
</c:when>
<c:when test='${catid == 3}'>
	<c:forEach var="sub_category" items="${list2}">
		<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
	</c:forEach>
</c:when>
<c:otherwise>
	<c:forEach var="sub_category" items="${list2}">
		<option value="${sub_category.subcatId}">${sub_category.subcatNm}</option>
	</c:forEach>
</c:otherwise>
</c:choose>
</script>