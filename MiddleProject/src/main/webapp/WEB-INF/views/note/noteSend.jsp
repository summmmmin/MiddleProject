<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="site-section">
    <div class="container">
        <div class="col-md-3">
<div class="sidebar">
  <c:choose>
    <c:when test="${userinfo.userGrade == '관리자'}">
      <!-- 관리자 메뉴 -->
      <div style="color: red; font-weight: bold;">-- 관리자 메뉴 --</div>
      <a href="userViewForm.do">유저정보 조회</a>
      <a href="sellList.do">판매내역 조회</a>
      <a href="buyList.do">구매내역 조회</a>
      <a href="sendNote.do">쪽지보내기</a>
    </c:when>
    <c:otherwise>
      <!-- 일반 사용자 메뉴 -->
      <a href="mypageView.do">내 정보 보기</a>
      <a href="wishList.do">관심상품</a>
      <a href="sellListU.do">나의 판매내역</a>
      <a href="buyListU.do">나의 구매내역</a>
      <a href="myQna.do">나의 Q&A</a>
      <a href="noteList.do">받은 쪽지함</a>
      <a href="myReview.do">나의 리뷰</a>
    </c:otherwise>
  </c:choose>
</div>
        </div>
        <div class="row justify-content-md-center">
            <div class="col-md-7">
                <h2 class="h3 mb-3 text-black">쪽지보내기</h2>
                <form method="post" id="form">
                    <div class="p-3 p-lg-5 border">
                        <table class="table">
                            <tr>
                                <th scope="col" class="text-primary">내용</th>
                                <td> <textarea name="subject" cols="30" rows="15" class="form-control" placeholder="Write your notes here..."></textarea></td>
                            </tr>
                        </table>

                        <div class="d-flex justify-content-center">
                            <input type="text" id="all" name="userId" class="form-control" placeholder="이메일을 입력해주세요" style="width:220px; margin-left:43px;">
                            <label for="myCheck" style="margin-top:4px; margin-left:10px;">모두에게 보내기:</label>
                            <input type="checkbox" name="checkbox1" id="myCheck" onclick="myFunction()" style="margin-bottom:10px; margin-left:5px;">
                        </div>

                        <div class="d-flex justify-content-end" style="margin-top:50px;">
                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="send()">보내기</button>
                            <button class="btn btn-outline-dark btn-sm " onclick=location.href='main.do'">목차</a></button>
						</div>
				</div>
				</form>
		  </div>
	  </div>
	</div>
	</div>
	<script src=" https://code.jquery.com/jquery-3.4.1.js"> </script> <script>
                                var tmp;
                                function myFunction() {
                                var checkBox = document.getElementById("myCheck");
                                tmp = $('[name=checkbox1]').is(':checked')
                                let all =document.getElementById('all')
                                all.readOnly = true;
                                all.placeholder = "모두 선택됨!";
                                if (checkBox.checked == true){
                                text.style.display = "block";

                                } else {
                                text.style.display = "none";
                                }
                                }

                                function send(){
                                if( tmp ){
                                console.log(tmp);
                                $('#form').attr("action","sendAllNote.do").submit();

                                }else{
                                $('#form').attr("action","noteSend.do").submit();
                                }
                                }


                                </script>