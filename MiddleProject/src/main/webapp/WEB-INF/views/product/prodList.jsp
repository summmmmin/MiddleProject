<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">


<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="site-wrap">
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
							<div class="col-md-12 mb-5">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">상품 목록</h2>
								</div>
								<div class="d-flex">
									<div class="dropdown mr-1 ml-md-auto">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuOffset" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Latest</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="#">Men</a> <a
												class="dropdown-item" href="#">Women</a> <a
												class="dropdown-item" href="#">Children</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5">
							<c:forEach var="product" items="${list}">
								<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
									<div class="block-4 text-center border">
										<figure class="block-4-image">
											<a href="getProd.do?&page=${pageInfo.pageNum}&pid=${product.pdtId}"><img src="images/${product.pdtImg}"
												alt="Image placeholder" class="img-fluid"></a>
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a href="getProd.do?&page=${pageInfo.pageNum}&pid=${product.pdtId}">${product.pdtNm}</a>
											</h3>
											<p class="mb-0">${product.brdNm}</p>
											<p class="text-primary font-weight-bold">${product.pdtPrice}</p>
											<p>${product.pdtViews}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary me-md-2" type="button"
								onclick="location.href='prodAddForm.do'">게시글 등록</button>
						</div>
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
										<li><c:if test="${pageInfo.prev}">
												<a href="prodList.do?page=${pageInfo.startPage-1}">&lt;</a>
											</c:if></li>
										<c:forEach var="i" begin="${pageInfo.startPage}"
											end="${pageInfo.endPage}">
											<li><a class="${i == pageInfo.pageNum ? 'active' : ''}"
												href="prodList.do?page=${i}">${i}</a></li>
										</c:forEach>
										<li><c:if test="${pageInfo.next}">
												<a href="prodList.do?page=${pageInfo.endPage+1}">&gt;</a>
											</c:if></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-3 order-1 mb-5 mb-md-0">
						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
								<label for="${categories.catId}" class="d-flex"> 
									<input type="checkbox" id="${categories.catId}" class="mr-2 mt-1"> 
										<span class="text-black">${categories.catNm}</span>
										<span class="text-black ml-auto">(2,319)</span>
								</label> 

								<c:forEach var="categories" items="${list}">
									<label for="${categories.catId}" class="d-flex"> 
										<input type="checkbox" id="${categories.catId}" class="mr-2 mt-1"> 
											<span class="text-black">${categories.catNm}</span>
											<span class="text-black ml-auto">${total}</span>
									</label> 
								</c:forEach>
								select count(*) from product where cat_id=?
								숫자


								int total;
								int[] cntarr = new int[list.size]
								for(카테고리리스트크기만큼){
									total = service.getcount(list[i].catId)
									
								}
								<label for="Women" class="d-flex"> <input
									type="checkbox" id="Women" class="mr-2 mt-1"> <span
									class="text-black">하의</span> <span
									class="text-black ml-auto">(1,282)</span>
								</label> <label for="Children" class="d-flex"> <input
									type="checkbox" id="Children" class="mr-2 mt-1"> <span
									class="text-black">아우터</span> <span
									class="text-black ml-auto">(1,392)</span>
								</label> <label for="Children" class="d-flex"> <input
									type="checkbox" id="Children" class="mr-2 mt-1"> <span
									class="text-black">신발</span> <span
									class="text-black ml-auto">(1,392)</span>
								</label>
							</div>
						</div>

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">gender</h3>
								<label for="Men" class="d-flex"> <input type="checkbox"
									id="Men" class="mr-2 mt-1"> <span class="text-black">Men</span>
									<span class="text-black ml-auto">(2,319)</span>
								</label> <label for="Women" class="d-flex"> <input
									type="checkbox" id="Women" class="mr-2 mt-1"> <span
									class="text-black">Women</span> <span
									class="text-black ml-auto">(1,282)</span>
								</label> <label for="Children" class="d-flex"> <input
									type="checkbox" id="Children" class="mr-2 mt-1"> <span
									class="text-black">Children</span> <span
									class="text-black ml-auto">(1,392)</span>
								</label>
							</div>
						</div>

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">brand</h3>
								<label for="Men" class="d-flex"> <input type="checkbox"
									id="Men" class="mr-2 mt-1"> <span class="text-black">NIKE</span>
									<span class="text-black ml-auto">(2,319)</span>
								</label> <label for="Women" class="d-flex"> <input
									type="checkbox" id="Women" class="mr-2 mt-1"> <span
									class="text-black">Adidas</span> <span
									class="text-black ml-auto">(1,282)</span>
								</label> <label for="Children" class="d-flex"> <input
									type="checkbox" id="Children" class="mr-2 mt-1"> <span
									class="text-black">Zara</span> <span class="text-black ml-auto">(1,392)</span>
								</label> <label for="Children" class="d-flex"> <input
									type="checkbox" id="Children" class="mr-2 mt-1"> <span
									class="text-black">UNIQLO</span> <span
									class="text-black ml-auto">(1,392)</span>
								</label> <label for="Children" class="d-flex"> <input
									type="checkbox" id="Children" class="mr-2 mt-1"> <span
									class="text-black">Puma</span> <span class="text-black ml-auto">(1,392)</span>
								</label> <label for="Children" class="d-flex"> <input
									type="checkbox" id="Children" class="mr-2 mt-1"> <span
									class="text-black">fila</span> <span class="text-black ml-auto">(1,392)</span>
								</label>

							</div>
						</div>

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
								<label for="s_sm" class="d-flex"> <input type="checkbox"
									id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small</span>
									<span class="text-black ml-auto">(2,319)</span>
								</label> <label for="s_md" class="d-flex"> <input
									type="checkbox" id="s_md" class="mr-2 mt-1"> <span
									class="text-black">Medium</span> <span
									class="text-black ml-auto">(1,282)</span>
								</label> <label for="s_lg" class="d-flex"> <input
									type="checkbox" id="s_lg" class="mr-2 mt-1"> <span
									class="text-black">Large</span> <span
									class="text-black ml-auto">(1,392)</span>
								</label>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>

	<script src="js/main.js"></script>

</body>

</html>