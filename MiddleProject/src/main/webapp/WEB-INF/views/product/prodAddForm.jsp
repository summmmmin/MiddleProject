<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class=container>
	<h3>상품 등록</h3>

	<form action="addProd.do" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th scope="col" class="text-primary">카테고리</th>
				<td>
					<div class="form-row align-items-center">
						<div class="col-auto my-1">
							<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>Choose...</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">세부 카테고리</th>
				<td><div class="form-row align-items-center">
						<div class="col-auto my-1">
							<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>Choose...</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div></td>
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
				<td><div class="form-row align-items-center">
						<div class="col-auto my-1">
							<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>Choose...</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">첨부파일</th>
				<td><input type="file" name="img"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">등록</button>
					<button type="reset">삭제</button>
				</td>
			</tr>
		</table>
	</form>
</div>