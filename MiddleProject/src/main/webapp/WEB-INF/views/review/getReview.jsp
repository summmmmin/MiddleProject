<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="stie-section">
	<div class="container">
		<div class="row justify-content-md-center">
			
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
									<td width="10%"><img src="images/"
										+"${buyInfo.pdtImg}" width="100px" height="100px" alt="" /></td>
									<td>${buyInfo.pdtNm}</td>
									<td>${buyInfo.sizeSize}</td>
									<td>${buyInfo.brdNm}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			
			<div class="col-md-12">
				<h2 class="h3 mb-3 text-black">리뷰</h2>
				<div class="p-3 p-lg-5 border">
					<table class="table"
						style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td scope="col" style="width: 20%" class="text-primary">제목</td>
							<td colspan="2">${reviewInfo.reviewTitle}</td>
						</tr>
						<tr>
							<td scope="col" class="text-primary">작성자</td>
							<td colspan="2">${reviewInfo.userNm}</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/${reviewInfo.reviewImg}"
								alt="Image" class="img-fluid"></td>
						</tr>
						<tr>
							<td colspan="2" style="min-height: 200px;">${reviewInfo.reviewCt}</td>
						</tr>
					</table>
					<div class="d-flex justify-content-end">
						<c:if test="${buyInfo.userId == userinfo.userId}">
							<button type="button"
								onclick="location.href='delReview.do?rid=${reviewInfo.reviewId}'"
								class="btn btn-danger btn-sm">삭제</button>
						</c:if>
						<button class="btn btn-outline-dark btn-sm"
							onclick="location.href='getProd.do?pid=${prodInfo.pdtId}'">이전으로</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>