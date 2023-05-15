<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
/*관심상품 색*/
.btn-pink {
	color: #fff;
	background-color: #e83e8c;
	border-color: #e83e8c;
}
</style>
<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">${prodInfo.pdtNm}</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="images/${prodInfo.pdtImg}" alt="Image" class="img-fluid">
			</div>
			<div class="col-md-6">
				<h2 class="text-black">${prodInfo.pdtNm}</h2>
				<p class="mb-4">${prodInfo.brdNm}</p>
				<p>
					<strong class="text-primary h4">${prodInfo.pdtPrice}</strong>
				</p>

				<div class="mb-5">
					<div class="input-group mb-3" style="max-width: 120px;"></div>

				</div>
				<div class="mb-5">
					<button class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#buyModal">구매하기</button>
					<button class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#sellModal">판매하기</button>
					<button class="btn btn-sm btn-pink" data-toggle="modal"
						data-target="#wishModal" data-pid="${prodInfo.pdtId}"
						onclick="openWishModal(this)">관심상품</button>
				</div>
				<div class="mb-5">
					<c:if test="${userinfo.userGrade == '관리자'}">
						<button class="btn btn-sm btn-blue" type="button"
							onclick="location.href='modifyProd.do?pid=${prodInfo.pdtId}'">수정하기</button>
						<button class="btn btn-sm btn-red" type="button"
							onclick="location.href='delProd.do?pid=${prodInfo.pdtId}'">삭제하기</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="site-section block-3 site-blocks-2 bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-7 site-section-heading text-center pt-4">
				<h2>추천 상품</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="nonloop-block-3 owl-carousel">
					<c:forEach var="product2" items="${product2}" begin="0" end="4">
						<div class="item">
							<div class="block-4 text-center">
								<figure class="block-4-image">
									<a href="getProd.do?&pid=${prodInfo.pdtId}"> <img
										src="images/${product2.pdtImg}" alt="Image placeholder"
										class="img-fluid">
									</a>
								</figure>
								<div class="block-4-text p-4">
									<h3>
										<a href="getProd.do?&pid=${prodInfo.pdtId}">${product2.pdtNm}</a>
									</h3>
									<p class="mb-0">${product2.brdId}</p>
									<p class="text-primary font-weight-bold">${product2.pdtPrice}</p>
									<p>${product2.pdtViews}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="site-section block-3 site-blocks-2 bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-2 site-section-heading text-center pt-4">
				<h2>리뷰</h2>
			</div>
		</div>
		<div class="row" id="reviewrow"></div>
	</div>
</div>
<div class="row" id="page" data-aos="fade-up">
	<div class="col-md-12 text-center">
		<div class="site-block-27">
			<ul>
			</ul>
		</div>
	</div>
</div>
<!-- 구매하기 -->
<div class="modal fade" style="z-index: 2000;" id="buyModal"
	tabindex="-1" aria-labelledby="buyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="buyModalLabel">구매하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container" id="sizeBuy">
					<div class="row">
						<c:forEach var="i" begin="0" end="${fn:length(sizeList)-1 }">
							<div class="col-sm-4">
								<button type="button" class="btn btn-primary btn-lg btn-block">
									<c:choose>
										<c:when test="var == 1">
											<input type="radio" name="sizes" id="${sizeList[i].sizeId }"
												checked>
										</c:when>
										<c:otherwise>
											<input type="radio" name="sizes" id="${sizeList[i].sizeId }">
										</c:otherwise>
									</c:choose>
									${sizeList[i].sizeSize }<br>
									<c:choose>
										<c:when test="${not empty priceBuy[i]}">
											<span>${priceBuy[i].sellPrice }</span>
										</c:when>
										<c:otherwise>
											<span>구매입찰</span>
										</c:otherwise>
									</c:choose>
								</button>
								<br />
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary"
					onclick="sizeBuySelc()">구매하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 판매하기 -->
<div class="modal fade" style="z-index: 2000;" id="sellModal"
	tabindex="-1" aria-labelledby="sellModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="sellModalLabel">판매하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container" id="sizeSelec">
					<div class="row">
						<c:forEach var="i" begin="0" end="${fn:length(sizeList)-1 }">
							<div class="col-sm-4">
								<button type="button" class="btn btn-primary btn-lg btn-block">
									<c:choose>
										<c:when test="var == 1">
											<input type="radio" name="sizes" id="${sizeList[i].sizeId }"
												checked>
										</c:when>
										<c:otherwise>
											<input type="radio" name="sizes" id="${sizeList[i].sizeId }">
										</c:otherwise>
									</c:choose>
									${sizeList[i].sizeSize }<br>
									<c:choose>
										<c:when test="${not empty priceList[i]}">
											<span>${priceList[i].buyPrice }</span>
										</c:when>
										<c:otherwise>
											<span>판매입찰</span>
										</c:otherwise>
									</c:choose>
								</button>
								<br />
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary" onclick="sizeSelc()">
					판매하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 관심상품 modal 설정 -->
<div class="modal fade" id="wishModal" tabindex="-1"
	aria-labelledby="wishModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="wishModalLabel">관심상품</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>관심 상품에 저장되었습니다.</p>
			</div>
			<div class="modal-footer">
				<a href="wishList.do" class="btn btn-primary btn-pink">관심상품으로 이동</a>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<a onclick="pageSelc(this)" id="test11"></a>
<div class="row" id="template" style="display: none;">
	<div class="col-sm-3">
		<div class="block-4 text-center">
			<figure class="block-4-image">
				<a href="getProd.do?&pid=prodInfo.pdtId"> <img
					src="images/product2.pdtImg" alt="Image placeholder"
					class="img-fluid" id="reviewImg">
				</a>
			</figure>
			<div class="block-4-text p-4">
				<h3>
					<a href="getProd.do?&pid=prodInfo.pdtId" class="reviewTitle"
						id="reviewTitle">product2.pdtNm</a>
				</h3>
				<p class="mb-0">product2.brdId</p>
				<p class="text-primary font-weight-bold">product2.pdtPrice</p>
			</div>
		</div>
	</div>

</div>
<script>
	  function sizeBuySelc(){
		  let radios = document.getElementsByName('sizes');
    	  let size;
    	  for (let radio of radios){
    		  if (radio.checked) {
      	        size = radio.id;
      	        console.log(size)      	        
      	      }
    	  }
    	  location.href='buyPrice.do?prodId=${prodInfo.pdtId}&size='+size;
	  }
      function sizeSelc(){
    	  let radios = document.getElementsByName('sizes');
    	  let size;
    	  for (let radio of radios){
    		  if (radio.checked) {
      	        size = radio.id;
      	        console.log(size)
      	        
      	      }
    	  }
    	  location.href='sellPrice.do?prodId=${prodInfo.pdtId}&size='+size;
      }
      document.addEventListener('DOMContentLoaded', pageSelc(this));
      function pageSelc(pg){
    	  let page = '${param.page}';
    	  page = 1;
			if(pg.tagName == 'A') {
				page = pg.className;
			}
			
      fetch('prodReview.do', {
    	  method: 'POST',
    	  body: 'pdtId='+${prodInfo.pdtId}+ '&page='+page,
    	  headers: {
    		  'Content-Type': 'application/x-www-form-urlencoded'
    	  }
      })
      .then(result => result.json())
      .then(resolve => {
    	  console.log(resolve)
    	  document.querySelector('#reviewrow').innerHTML = '';
    	  console.log(document.querySelector('#template>div'));
    	  resolve.list.forEach(item => {
    		  let template = document.querySelector('#template>div').cloneNode(true);
    		  template.querySelector('.img-fluid').src = "./images/"+item.reviewImg;
    		  template.querySelector('.reviewTitle').innerText = item.reviewTitle
    		  template.querySelector('.mb-0').innerText = item.reviewCt
    		  template.querySelector('.font-weight-bold').innerText = item.userNm
    		  template.querySelector('img').id = 'reviewImg'+item.reviewId;
    		  template.querySelector('a:nth-of-type(1)').href = "getReview.do?page=${param.page}&rid="+item.reviewId;
    		  template.querySelector('.reviewTitle').href = "getReview.do?page=${param.page}&rid="+item.reviewId;
    		  document.querySelector('#reviewrow').append(template);
    	  })
    	  let page = document.querySelector('#page');
    	  let ul = page.querySelector('ul');
    	  console.log(page)
    	  ul.innerHTML = '';
    	  let li = document.createElement('li');
    	  let a = document.querySelector('#test11').cloneNode(true);
    	  if (resolve.pageInfo.prev) {
    		  a.className = (resolve.pageInfo.startPage-1);
    		  
    		  li.append(a);
    		  a.innerText = '<';
    	  }
    	  ul.append(li);
    	  for (let i = resolve.pageInfo.startPage; i<=resolve.pageInfo.endPage; i++) {
    		  li = document.createElement('li');
    		  a = document.querySelector('#test11').cloneNode(true);
    		  li.className = (i == resolve.pageInfo.pageNum ? 'active' : '');
    		  a.className = (i);
    		  a.innerText = (i);
    		  li.append(a);
    		  ul.append(li);
    	  }
    	  li = document.createElement('li');
    	  a = document.querySelector('#test11').cloneNode(true);
    	  if (resolve.pageInfo.next) {
    		  a.className = (resolve.pageInfo.endPage+1);
    		  
    		  li.append(a);
    		  a.innerText = '>';
    	  }
    	  ul.append(li);
      })
      .catch(err => console.log(err))
      }
</script>
<script src="js/AddWishList.js"></script>