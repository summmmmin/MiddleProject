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
						<a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">MyPage</strong>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="site-section">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-md-7">
                <div class="d-flex justify-content-center">
                    <div class="p-3 p-lg-5 border">
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_email" class="text-black" style="font-weight: bold; font-size: 15px">현재 사용자</label>
                                <div style="border: 1px solid #ced4da; padding: 10px;">
                                    <c:out value="${sessionScope.userinfo.userId}" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <form method="post" action="mypagePw.do">
                                    <label for="user_pw" class="text-black" style="font-weight: bold; font-size: 15px;">현재 비밀번호 확인</label>
                                        <input type="password" id="user_pw" name="user_inputpw" class="form-control" placeholder="현재 비밀번호를 입력하세요" />
                                    <div class="mt-3">
                                        <input type="submit" value="확인" class="btn btn-primary py-2 px-4 text-white">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>