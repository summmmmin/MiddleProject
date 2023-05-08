<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
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
						<a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Mypage</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col-md-7">
						<h2 class="h3 mb-3 text-black">마이페이지</h2>

						<form action="mypageView.do" method="post">
							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_email" class="text-black">이름</label>
										<input type="text" class="form-control" id="name" name="name" value="${userinfo.userNm}" readonly>
									</div>
									<div class="col-md-6">
										<label for="c_email" class="text-black">아이디</label>
										<input type="text" class="form-control" id="id" name="id" value="${userinfo.userId}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_email" class="text-black">전화번호</label>
										<input type="text" class="form-control" id="phone" name="phone" value="${userinfo.userPh}" readonly>
									</div>
									<div class="col-md-6">
										<label for="c_email" class="text-black">주소</label>
										<input type="text" class="form-control" id="address" name="address" value="${userinfo.userAddr}"
											readonly>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_email" class="text-black">등급</label>
										<input type="text" class="form-control" id="grade" name="grade" value="${userinfo.userGrade}"
											readonly>
									</div>
									<div class="col-md-6">
										<label for="c_email" class="text-black">포인트</label>
										<input type="text" class="form-control" id="points" name="points" value="${userinfo.userPoint}"
											readonly>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<label for="newPassword-toggle" class="text-black"></label>
										<input type="password" class="form-control" id="newPassword" name="newPassword"
											style="display:none;">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<input type="submit" class="btn btn-primary btn-lg btn-block" value="변경">
									</div>
									<div class="col-md-6">
										<input type="button" class="btn btn-danger btn-lg btn-block" value="탈퇴"
											onclick="if(confirm('정말 탈퇴하시겠습니까?')){location.href='탈퇴처리_주소';}">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>