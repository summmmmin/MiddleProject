<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="site-section">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-7">
				<h1 class="h3 mb-3 text-black">리뷰 등록</h1>
				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">구매상품</h2>
						<div class="p-3 p-lg-5 border">
							<table class="table site-block-order-table mb-5">
								<thead>
									<th>상품</th>
									<th>상품명</th>
									<th>사이즈</th>
									<th>브랜드</th>
								</thead>
								<tbody>
									<tr id="prod">
										<td width="10%"><img src="images/
											+${buyInfo.pdtImg}" width="100px" height="100px" alt="" /></td>
										<td>${buyInfo.pdtNm}</td>
										<td>${buyInfo.sizeSize}</td>
										<td>${buyInfo.brdNm}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<form action="addReview.do?bid=${buyInfo.buyId}" method="post"
					enctype="multipart/form-data" id="review">
					<div class="p-3 p-lg-5 border">
						<table class="table">
							<tr>
								<th scope="col" class="text-primary">제목</th>
								<td><input type="text" class="form-control" name="title"></td>
							</tr>
							<tr>
								<th scope="col" class="text-primary">작성자</th>
								<td><span class="input-group-text" padding-right="5px">${userinfo.userNm}</span></td>
							</tr>
							<tr>
								<th scope="col" class="text-primary">내용</th>
								<td><textarea name="ct" cols="30" rows="15"
										class="form-control" placeholder="내용을 입력하세요"></textarea></td>
							</tr>
							<tr>
								<th scope="col" class="text-primary">첨부파일</th>
								<td><input type="file" name="img"></td>
							</tr>
						</table>
					</div>
				</form>
				<div class="d-flex justify-content-end">
					<button type="submit" class="btn btn-outline-primary btn-sm"
					form="review">등록</button>
					<button class="btn btn-outline-dark btn-sm"
						onclick="location.href='buyListU.do'">목차</button>
				</div>
			</div>
		</div>
	</div>
</div>