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
							<select class="form-control" id="catId" name="catId" onchange="catAction()">
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
var subList;
//category 선택했을때(onchange)
function catAction() {
	var cat = document.getElementById('catId');
	var catVal = cat.options[cat.selectedIndex].value;
	console.log(catVal);
	
	//option 비우기
	$('[name="subcatId"]').empty();
	$('[name="subcatId"]').append('<option selected disabled value="">선택하세요</option>');
	
	//option추가
	subList.forEach(subcat=>{
		if(subcat.catId == catVal){
			$('[name="subcatId"]').append('<option value="'+subcat.subcatId+'">'+subcat.subcatNm+'</option>')
		}
	})
}
//subcategory 목록 가져오기
fetch('subCatList.do')
.then(resolve=>resolve.json())
.then(result=>{
	subList = result; //결과를 subList에 넣기
})
.catch(err=>console.log(err));

</script>