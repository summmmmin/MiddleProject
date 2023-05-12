<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
    .card {
        padding: 10px;
    }

    body {
        margin: 10px;
    }

    .btn {
        display: inline-block;
        vertical-align: middle;
    }

    #btn1 {
        margin-left: 13px;
        padding: 10px;
    }

    #btn2 {
        padding: 11px 14px 11px 14px;
    }

    #login-buttons {
        display: flex;
        justify-content: center;
        margin-top: 10px;
        margin-right: 10px;
    }

    #login-buttons span {
        margin: 0 12px;
    }

    .form-input-error {
        border: 1px solid red;
    }
</style>

<div id="content" class="flex">
    <div class="">
        <div class="page-content page-container" id="page-content">
            <div class="padding">
                <div class="row justify-content-center">
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-header">
                                <strong>로그인</strong>
                            </div>
                            <div class="card-body">
                                <form action="login.do" method="POST" onsubmit="return validateForm()">
                                    <div class="form-group">
                                        <label class="text-muted" for="exampleInputEmail1">아이디</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" name="user_id"> <small id="emailHelp" class="form-text text-muted">아이디는 이메일 형식입니다</small>
                                    </div>
                                    <div class="form-group">
                                        <label class="text-muted" for="exampleInputPassword1">비밀번호</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="" name="user_pw">
                                        <c:if test="${not empty message}">
                                            <p style="color: red; font-size: 12px;">${message}</p>
                                        </c:if>

                                    </div>
                                    <div id="login-buttons">
                                        <span><a href="signUpForm.do" class="btn btn-primary" id="btn1">회원가입</a></span> <span><button type="submit" class="btn btn-primary" id="btn2">로그인</button></span>
                                    </div>
                                </form>
                                <form style="text-align: center;">
                                    <div style="margin-top: 10px;">
                                        <a id="kakao-login-btn"></a>
                                        <script type='text/javascript'>
                                            //<![CDATA[
                                            // 사용할 앱의 JavaScript 키를 설정해 주세요.
                                            Kakao
                                                .init('249145e2a71a25b1b51911632f58433c');
                                            // 카카오 로그인 버튼을 생성합니다.
                                            Kakao.Auth
                                                .createLoginButton({
                                                    container: '#kakao-login-btn',
                                                    success: function(
                                                        authObj) {
                                                        // 로그인 성공시, API를 호출합니다.
                                                        Kakao.API
                                                            .request({
                                                                url: '/v2/user/me',
                                                                success: function(
                                                                    res) {
                                                                  //  alert(JSON
                                                                    //    .stringify(res));
                                                                   // alert(JSON
                                                                     // .stringify(authObj));
                                                                   
                                                                   location.href = "kakaoUser.do"
                                                                    console
                                                                        .log(res.id);
                                                                    console
                                                                        .log(res.kakao_account);
                                                                    console
                                                                        .log(res.properties['nickname']);
                                                                    console
                                                                        .log(authObj.access_token);

                                                                    // AJAX 요청을 보내는 부분
                                                                    var email = res.kakao_account.email;
                                                                    var nickname = res.properties.nickname;

                                                                    console
                                                                        .log(email);
                                                                    console
                                                                        .log(nickname);

                                                                    // AJAX 코드 작성 및 서버로 데이터 전송
                                                                    var xhr = new XMLHttpRequest();
                                                                    xhr
                                                                        .open(
                                                                            'POST',
                                                                            'http://localhost:8081/MiddleProject/kakaoLogin.do',
                                                                            true);
                                                                    xhr
                                                                        .setRequestHeader(
                                                                            'Content-Type',
                                                                            'application/json');

                                                                    var data = {
                                                                        email: res.kakao_account.email,
                                                                        nickname: res.properties.nickname
                                                                    };

                                                                    xhr.onreadystatechange = function() {
                                                                        if (xhr.readyState === 4 &&
                                                                            xhr.status === 200) {
                                                                        }
                                                                    };

                                                                    xhr
                                                                        .send(JSON
                                                                            .stringify(data));
                                                                    console
                                                                },
                                                                fail: function(
                                                                    error) {
                                                                }
                                                            });
                                                    },
                                                    fail: function(err) {
                                                    }
                                                });

                                            //]]>
                                        </script>
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
<script src="js/login.js"></script>