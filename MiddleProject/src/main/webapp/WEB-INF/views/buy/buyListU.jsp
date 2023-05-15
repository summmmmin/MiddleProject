<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="bg-light py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-12 mb-0">
        <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span>
        <strong class="text-black">구매내역</strong>
      </div>
    </div>
  </div>
</div>

<div class="site-section">
  <div class="container">
    <div class="row">
        			<div class="col-md-3">
<div class="sidebar">
  <c:choose>
    <c:when test="${userinfo.userGrade == '관리자'}">
      <!-- 관리자 메뉴 -->
      <div style="color: red; font-weight: bold;">-- 관리자 메뉴 --</div>
      <a href="userView.do">유저정보 조회</a>
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
      <div class="col-md-12">
        <div class="site-blocks-table">
          <c:set var="no" value="0"></c:set>
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col"></th>
                <th scope="col">구매번호</th>
                <th scope="col">구매일자</th>
                <th scope="col">상품</th>
                <th scope="col">브랜드</th>
                <th scope="col">사이즈</th>
                <th scope="col">가격</th>
                <th scope="col">상태</th>
                <th scope="col">취소</th>
                <th scope="col">반품</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="buy" items="${list }">
                <tr id="${buy.buyId }">
                  <th scope="row"><c:out value="${no=no+1 }"></c:out></th>
                  <td><a href="buyDetail.do?buyId=${buy.buyId }">${buy.buyId }</a></td>
                  <td>${buy.buyDate }</td>
                  <td>${buy.pdtNm }</td>
                  <td>${buy.brdNm }</td>
                  <td>${buy.sizeSize }</td>
                  <td>${buy.buyPrice }</td>
                  <td>${buy.buyDlvy }</td>
                  <c:choose>
                    <c:when
                      test="${buy.buyCancel == 'N' && (buy.buyDlvy == '구매입찰중')}"
                    >
                      <td><button class="cancelBtn btn btn-sm btn-primary" data-id="${buy.buyId }" data-toggle="modal" data-target="#cancelModal">취소신청</button></td>
                    </c:when>
                    <c:otherwise>
                      <td>${buy.buyCancel }</td>
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when
                      test="${buy.buyReturn == 'N' && buy.buyDlvy == '배송완료'}"
                    >
                      <td><button class="returnBtn btn btn-sm btn-primary" data-id="${buy.buyId }" data-toggle="modal" data-target="#returnModal">반품신청</button></td>
                    </c:when>
                    <c:otherwise>
                      <td>${buy.buyReturn }</td>
                    </c:otherwise>
                  </c:choose>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="row" data-aos="fade-up">
      <div class="col-md-12 text-center">
        <div class="site-block-27">
          <ul>
            <li>
              <c:if test="${pageInfo.prev}">
                <a href="buyListU.do?page=${pageInfo.startPage-1}">&lt;</a>
              </c:if>
            </li>
            <c:forEach
              var="i"
              begin="${pageInfo.startPage}"
              end="${pageInfo.endPage}"
            >
              <li class="${i == pageInfo.pageNum ? 'active' : ''}">
                <a href="buyListU.do?page=${i}">${i}</a>
              </li>
            </c:forEach>
            <li>
              <c:if test="${pageInfo.next}">
                <a href="buyListU.do?page=${pageInfo.endPage+1}">&gt;</a>
              </c:if>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" style="top:200px;" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cancelModalLabel">취소</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        취소하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="cancelCheck">취소하기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" style="top:200px;" id="returnModal" tabindex="-1" aria-labelledby="returnModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="returnModalLabel">반품</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>상품에 문제가 있을때만 반품이 가능합니다.</p>
        <p>반품 신청하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="returnCheck">신청하기</button>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

	$(document).on("click", ".cancelBtn", function () {
	    let cancelId = $(this).data('id');
	    $("#cancelCheck").on("click", function(){
	    	
	    	fetch('buyCancel.do',{
	    		method:'POST',
	    		headers:{
	    		  'Content-Type':'application/x-www-form-urlencoded'
	    		}, body : 'id='+cancelId
	    	})
	    	.then(resolve=>resolve.json())
	    	.then(result=>{
	    		if(result.retCode == 'Success'){
	    			$('#cancelModal').modal("hide");
	    			document.getElementById(cancelId).children[8].innerText='취소신청';
	    		} else if(result.retCode == 'Fail'){
	    			alert('처리 중 에러');
	    		} else{
	    			alert('알 수 없는 반환값')
	    		}
	    	})
	    	
	    })
	    
	    
	});
	$(document).on("click", ".returnBtn", function () {
	    let returnId = $(this).data('id');
	    $("#returnCheck").on("click", function(){
	    	fetch('buyReturn.do',{
	    		method:'POST',
	    		headers:{
	    		  'Content-Type':'application/x-www-form-urlencoded'
	    		}, body : 'id='+returnId
	    	})
	    	.then(resolve=>resolve.json())
	    	.then(result=>{
	    		if(result.retCode == 'Success'){
	    			$('#returnModal').modal("hide");
	    			document.getElementById(returnId).children[9].innerText='반품신청';
	    		} else if(result.retCode == 'Fail'){
	    			alert('처리 중 에러');
	    		} else{
	    			alert('알 수 없는 반환값')
	    		}
	    	})
	    })
	});
</script>
