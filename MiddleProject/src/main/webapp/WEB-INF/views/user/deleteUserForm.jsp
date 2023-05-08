<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<head>
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

<%
String id = (String) session.getAttribute("userinfo.userId");

if (id == null) {
	response.sendRedirect("main.do");
}
%>

</head>

<body>
	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Delete</strong>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-md-7">
					<form method="post" action="deleteUserForm.do">
						<div class="d-flex justify-content-center">
							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_email" class="text-black"
											style="font-weight: bold; font-size: 15px;">현재 사용자</label>
										<div id="email-duplicate-message" style="color: black;">
											<c:out value="${sessionScope.userinfo.userId}" />
										</div>
									</div>
								</div>
								<input type="password" name="user_pw"
									placeholder="현재 비밀번호를 입력하세요" /> <input type="submit"
									value="탈퇴" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
	<script src="js/custom.js"></script>
</body>