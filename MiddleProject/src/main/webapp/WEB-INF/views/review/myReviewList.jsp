<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="site-section">
<div class= container>
<h3>내가 쓴 리뷰</h3>
<table class="table">
	<thead>
		<tr>
			<th scope="col" class ="text-primary" >No</th>
			<th scope="col" class ="text-primary" >제목</th>
			<th scope="col" class ="text-primary" >작성자</th>
			<th scope="col" class ="text-primary" >DATE</th>
		</tr>
	</thead>
	<tbody id="rlist">
	</tbody>
</table>

<table style="display: none;">
	<tbody>
		<tr class="template">
			<td>리뷰번호</td>
			<td>제목</td>
			<td>구매상품</td>
			<td>작성자</td>
			<td>날짜</td>
		</tr>
	</tbody>
</table>
</div>
</div>
<script>
	let showFields = ['reviewId', 'reviewTitle', 'reviewWriter', 'reviewDate']
	let xhtp = new XMLHttpRequest();
	xhtp.open('get', 'myReview.do');
	xhtp.send();
	xhtp.onload = function () {
		console.log(xhtp.response);
		let rlist = document.querySelector("#rlist");
		
		let data = JSON.parse(xhtp.response);
		for (let review of data) {
			console.log(review);
			
		}
	}
	
	
	
	
</script>