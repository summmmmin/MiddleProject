<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <h1>마이페이지 테스트중</h1>
    <p>로그인한 사용자: <c:out value="${sessionScope.userinfo.userId}" /></p>
    <form method="post" action="mypage.do">
        <input type="password" name="user_pw" placeholder="현재 비밀번호를 입력하세요" />
        <input type="submit" value="확인" />
    </form>
</body>
</html>
