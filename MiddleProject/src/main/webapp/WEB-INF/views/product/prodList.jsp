<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.js-open-target, .js-close-target {
	cursor: pointer;
}
</style>

<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">Shop</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section">
	<div class="container">

		<div class="row mb-5">
			<div class="col-md-9 order-2">

				<div class="row">
					<div class="col-md-12 mb-2">
						<div class="float-md-left mb-4">
							<h2 class="text-black h5">상품 목록</h2>
						</div>
					</div>
				</div>
				<div class="row mb-5"></div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<c:if test="${userinfo.userGrade == '관리자'}">
						<button class="btn btn-primary me-md-2" type="button"
							onclick="location.href='prodAddForm.do'">게시글 등록</button>
					</c:if>
				</div>
				<div class="row" id="page" data-aos="fade-up">
					<div class="col-md-12 text-center">
						<div class="site-block-27">
							<ul>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3 order-1 mb-5 mb-md-0">
				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="cat" data-target=".closed-content1"
								onclick="categories()">카테고리</a>
						</h3>
						<div class="closed-content1" style="display: none;">
							<c:forEach var="i" begin="0" end="${fn:length(catlist)-1}">
								<div>
									<label class="d-flex"> <input type="checkbox"
										id="${catlist[i].catId}" class="mr-2 mt-1 catId"
										onclick="prod_categories(this)" value="${catlist[i].catId}">
										<span class="text-black">${catlist[i].catNm}</span> <span
										class="text-black ml-auto">(${cntarr[i]})</span>
									</label>
									<div style="display: none;">
										<c:forEach var="j" begin="0" end="${fn:length(subcatlist)-1}">
											<c:choose>
												<c:when test="${subcatlist[j].catId == catlist[i].catId}">
													<label class="d-flex"> <input type="checkbox"
														id="${subcatlist[j].subcatId}" class="mr-2 mt-1 subcatId"
														onclick="prod_categories(this)"
														value="${subcatlist[j].subcatId}"> <span
														class="text-black">${subcatlist[j].subcatNm}</span> <span
														class="text-black ml-auto">(${subcntarr[j]})</span>
													</label>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="gender"
								data-target=".closed-content3" onclick="gender()">성별</a>
						</h3>
						<div class="closed-content3" style="display: none;">
							<c:forEach var="i" begin="0" end="${fn:length(genderlist)-1}">
								<label class="d-flex"> <input type="checkbox"
									id="${genderlist[i].genderId}" class="mr-2 mt-1 gender"
									onclick="prod_categories(this)"
									value="${genderlist[i].genderId}"> <span
									class="text-black">${genderlist[i].genderNm}</span> <span
									class="text-black ml-auto">(${genderarr[i]})</span>
								</label>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="brand"
								data-target=".closed-content4" onclick="brand()">브랜드</a>
						</h3>
						<div class="closed-content4" style="display: none;">
							<c:forEach var="i" begin="0" end="${fn:length(brdlist)-1}">
								<label class="d-flex"> <input type="checkbox"
									id="${brdlist[i].brdId}" class="mr-2 mt-1 brand"
									onclick="prod_categories(this)" value="${brdlist[i].brdId}">
									<span class="text-black">${brdlist[i].brdNm}</span> <span
									class="text-black ml-auto">(${brdarr[i]})</span>
								</label>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="size"
								data-target=".closed-content5" onclick="size()">사이즈</a>
						</h3>
						<div class="closed-content5" style="display: none;">
							<c:forEach var="i" items="${sizeInfo}">
								<c:if
									test="${i.sizeId != 12 || i.sizeId != 13 || i.sizeId != 14}">
									<label> <input type="checkbox" id="${i.sizeId}"
										class="mr-2 mt-1 size" onclick="prod_categories(this)"
										value="${i.sizeSize}"> <span class="text-black">${i.sizeSize}</span>
									</label>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="template" style="display: none;">
	<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
		<div class="block-4 text-center border">
			<figure class="block-4-image">
				<a href="getProd.do?&page=pageInfo.pageNum&pid=product.pdtId"><img
					src="images/product.pdtImg" alt="Image placeholder"
					class="img-fluid" id="pdtImg"></a>
			</figure>
			<div class="block-4-text p-4">
				<h3>
					<a href="getProd.do?&page=pageInfo.pageNum&pid=product.pdtId"
						class="pdtNm" id="pdtNm">product.pdtNm</a>
				</h3>
				<p class="mb-0">product.brdNm</p>
				<p class="text-primary font-weight-bold">product.pdtPrice</p>
				<p class="pdtViews">product.pdtViews</p>
			</div>
		</div>
	</div>
</div>
<a onclick="prod_categories(this)" id="test11"></a>
<script>
	
	document.querySelectorAll('.catId').forEach(item => {
		item.addEventListener('click', function() {
			let subcat = this.parentElement.parentElement.children[1];
			if(this.checked){
				subcat.style = "display: block";				
			}else if(!this.checked){
				subcat.style = "display: none";	
			}
			
		})
	})

	function categories() {
		$('#cat').each(function () {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}

	function gender() {
		$('#gender').each(function () {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}

	function brand() {
		$('#brand').each(function () {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}

	function size() {
		$('#size').each(function () {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}
	
	document.addEventListener('DOMContentLoaded', prod_categories(this));
	function prod_categories (prodcat) {
		
		console.log(prodcat);
		let json;
		let str;
		let page = '${param.page}';
		if(prodcat.tagName == 'INPUT' || prodcat.tagName == 'A') {
			let arr = ['catId', 'subcatId', 'gender', 'brand', 'size'];
			let arr3 = [];
			for(let category of arr) {
				let prod = document.querySelectorAll('.'+category);
				let arr2 = [];
				for(let i = 0; i<prod.length; i++) {
					if(prod[i].checked) {
						arr2.push(prod[i].value);
					}
				}
				arr3.push(arr2);
			}
			json = {...arr3};
			str = JSON.stringify(json);
			page = 1;
			if(prodcat.tagName == 'A') {
				page = prodcat.className;
			}
			console.log(str);
		} else {
			
		}
		
		fetch('prodList2.do', {
            method: 'POST',
            body: 'data='+str+ '&page='+page,
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
		.then(result => result.json())
		.then(resolve => {
			console.log(resolve)
			document.querySelector('.col-md-9 .mb-5').innerHTML = '';
			resolve.list.forEach(item => {
				let template = document.querySelector('.template>div').cloneNode(true);
				template.querySelector('.img-fluid').src = "./images/"+item.pdtImg;
				template.querySelector('.pdtNm').innerText = item.pdtNm
				template.querySelector('.mb-0').innerText = item.brdNm
				template.querySelector('.font-weight-bold').innerText = item.pdtPrice
				template.querySelector('.pdtViews').innerText = item.pdtViews
				template.querySelector('img').id = 'pdtImg'+item.pdtId;
				template.querySelector('a:nth-of-type(1)').href = "getProd.do?page=${param.page}&pid="+item.pdtId;
				template.querySelector('.pdtNm').href = "getProd.do?page=${param.page}&pid="+item.pdtId;
				document.querySelector('.col-md-9 .mb-5').append(template);
			})
				let page = document.querySelector('#page');
				let ul = page.querySelector('ul');
				ul.innerHTML = ''; // 초기화
				let li = document.createElement('li');
				let a = document.querySelector('#test11').cloneNode(true);
				if (resolve.pageInfo.prev) {
					a.className = (resolve.pageInfo.startPage-1);
					
					li.append(a);
					a.innerText = '<';
				}
				ul.append(li);
				for (let i = resolve.pageInfo.startPage; i<resolve.pageInfo.endPage; i++) {
					li = document.createElement('li'); // 초기화
					a = document.querySelector('#test11').cloneNode(true); // 초기화
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