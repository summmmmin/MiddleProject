<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		label {
			display: block;
			margin-bottom: 10px;
		}
		input[readonly] {
			border: none;
			background-color: #f7f7f7;
		}
	</style>
</head>
<body>
	<h1>마이페이지</h1>
	<form action="mypageView.do" method="post">
		<label for="name">이름</label>
		<input type="text" id="name" name="name" value="${userInfo.userNm}" readonly>
		<label for="id">아이디</label>
		<input type="text" id="id" name="id" value="${userInfo.userId}" readonly>
		<label for="phone">전화번호</label>
		<input type="text" id="phone" name="phone" value="${userInfo.userPh}">
		<label for="address">주소</label>
		<input type="text" id="address" name="address" value="${userInfo.userAddr}">
		<label for="grade">등급</label>
		<input type="text" id="grade" name="grade" value="${userInfo.userGrade}" readonly>
		<label for="points">포인트</label>
		<input type="text" id="points" name="points" value="${userInfo.userPoint}" readonly>
		<label for="newPassword">비밀번호 변경</label>
		<input type="password" id="newPassword" name="newPassword">
<!--  		<label for="confirmPassword">Confirm Password</label>
		<input type="password" id="confirmPassword" name="confirmPassword">
		<input type="submit" value="Change Password"> -->
	</form>
</body>
</html>
