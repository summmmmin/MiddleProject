<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
body2 {
	font-family: Arial, sans-serif;
	background-color: #f1f1f1;
	color: #444444;
}

.container2 {
	max-width: 800px;
	margin: auto;
	padding: 50px;
	background-color: #ffffff;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
}

h1 {
	font-size: 36px;
	margin-bottom: 30px;
}

p {
	font-size: 18px;
	line-height: 1.6;
}

img {
	max-width: 50%;
	height: auto;
	margin-bottom: 20px;
}
</style>
</head>

<div class="container2">
	<h1>카카오 로그인 페이지</h1>
	<p>카카오 계정으로 로그인 되었습니다</p>
	<p>카카오 계정의 초기 비밀번호는 test 입니다. 마이페이지에서 비밀번호를 변경해주세요.</p>
	<p>약 7초 후 메인페이지로 이동합니다</p>
</div>


<script type="text/javascript">
	setTimeout(function() {
		window.location.href = 'main.do';
	}, 7000); // 5초 (5000ms)
</script>
