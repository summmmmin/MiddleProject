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
	margin: 0 auto;
	padding: 20px;
	background-color: #f5f5f5;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	color: black;
	font-family: Arial, sans-serif;
	border-radius: 10px;
}

.container2 h1 {
	font-weight: bold;
	font-size: 24px;
	color: #333333;
	margin-bottom: 20px;
}

.container2 p {
	font-size: 16px;
	color: #555555;
	margin-bottom: 10px;
}

h1 {
	font-size: 36px;
	margin-bottom: 30px;
}

.container2 p:last-child {
	margin-bottom: 0;
}

.container2 .main-page-link {
	display: block;
	text-align: center;
	margin-top: 30px;
	color: #333333;
	text-decoration: none;
	font-weight: bold;
}

.container2 .main-page-link:hover {
	color: #ff0000;
}

.container2 p span {
	color: red;
	font-weight: bold;
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

<div class="container2">
	<img
		src="https://media.istockphoto.com/id/890080684/ko/%EB%B2%A1%ED%84%B0/%ED%95%AD%EB%AA%A9-%ED%9D%94%EC%A0%81%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%B0%96%EC%9C%BC%EB%A1%9C-%EA%B5%90%EC%B0%A8-%EB%B9%A8%EA%B0%84%EC%83%89-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8%EC%97%90%EC%84%9C-%ED%8C%9C-%EC%86%90-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9D%84-%EC%A4%91%EC%A7%80-%ED%95%A9%EB%8B%88%EB%8B%A4-%EB%B2%A1%ED%84%B0.jpg?s=612x612&w=0&k=20&c=fX9YutqTQG0jyXhHtW0DnRkOwCgAuP2WEmQmKmnCua8="
		alt="Access Denied" style="width: 300px; height: 300px;">
	<h1>관리자 전용 페이지입니다.</h1>
	<p>약 5초 후 메인페이지로 자동으로 이동합니다</p>
	<a class="main-page-link" href="main.do">메인페이지로 이동</a>
</div>

<script type="text/javascript">
	setTimeout(function() {
		window.location.href = 'main.do';
	}, 5000); // 5초 (5000ms)
</script>
