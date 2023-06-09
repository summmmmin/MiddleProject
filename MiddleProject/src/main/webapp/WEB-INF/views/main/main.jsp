<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="site-blocks-cover"
	style="background-image: url(images/hero_1.jpg);" data-aos="fade">
	<div class="container">
		<div
			class="row align-items-start align-items-md-center justify-content-end">
			<div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
				<h1 class="mb-2">Finding Your Perfect Shoes</h1>
				<div class="intro-text text-center text-md-left">
					<p class="mb-4">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Phasellus at iaculis quam. Integer accumsan
						tincidunt fringilla.</p>
					<p>
						<a href="prodList.do" class="btn btn-sm btn-primary">지금 쇼핑하기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="site-section site-section-sm site-blocks-1">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
				data-aos="fade-up" data-aos-delay="">
				<div class="icon mr-4 align-self-start">
					<span class="icon-truck"></span>
				</div>
				<div class="text">
					<h2 class="text-uppercase">무료 배송</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
				data-aos="fade-up" data-aos-delay="100">
				<div class="icon mr-4 align-self-start">
					<span class="icon-refresh2"></span>
				</div>
				<div class="text">
					<h2 class="text-uppercase">무료 반품</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
				data-aos="fade-up" data-aos-delay="200">
				<div class="icon mr-4 align-self-start">
					<span class="icon-help"></span>
				</div>
				<div class="text">
					<h2 class="text-uppercase">고객 지원</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
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
									<a href="getProd.do?&pid=${product2.pdtId}"> <img
										src="images/${product2.pdtImg}" alt="Image placeholder"
										class="img-fluid">
									</a>
								</figure>
								<div class="block-4-text p-4">
									<h3>
										<a href="getProd.do?&pid=${product2.pdtId}">${product2.pdtNm}</a>
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
<div class="site-section block-8">
	<div class="container">
		<div class="row justify-content-center  mb-5">
			<div class="col-md-7 site-section-heading text-center pt-4">
				<h2>신규 상품</h2>
			</div>
		</div>
		<div class="row align-items-center">
			<div class="col-md-12 col-lg-7 mb-5">
				<a href="#"><img src="images/blog_1.jpg" alt="Image placeholder"
					class="img-fluid rounded"></a>
			</div>
			<div class="col-md-12 col-lg-5 text-center pl-md-5">
				<h2>
					<a href="prodList.do">전품목 50% 할인</a>
				</h2>
				<p class="post-meta mb-4">
					By <a href="#">Carl Smith</a> <span class="block-8-sep">&bullet;</span>
					September 3, 2018
				</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Quisquam iste dolor accusantium facere corporis ipsum animi
					deleniti fugiat. Ex, veniam?</p>
				<p>
					<a href="prodList.do" class="btn btn-primary btn-sm">지금 쇼핑하기</a>
				</p>
			</div>
		</div>
	</div>
</div>