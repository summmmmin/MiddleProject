<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<div class="bg-light py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-12 mb-0">
        <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span>
        <strong class="text-black">판매내역</strong>
      </div>
    </div>
  </div>
</div>

<div class="site-section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="site-blocks-table">
          <c:set var="no" value="0"></c:set>
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col"></th>
                <th scope="col">판매번호</th>
                <th scope="col">판매일자</th>
                <th scope="col">상품</th>
                <th scope="col">브랜드</th>
                <th scope="col">사이즈</th>
                <th scope="col">가격</th>
                <th scope="col">상태</th>
                <th scope="col">취소</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>1</td>
                <td>2023-05-04</td>
                <td>물건이름</td>
                <td>300</td>
                <td>5000</td>
                <td>정산완료</td>
              </tr>
              <c:forEach var="sell" items="${list }">
                <tr>
                  <th scope="row"><c:out value="${no=no+1 }"></c:out></th>
                  <td><a href="sellDetail.do?sellId=${sell.sellId }">${sell.sellId }</a></td>
                  <td>${sell.sellDate }</td>
                  <td>${sell.pdtNm }</td>
                  <td>${sell.brdNm }</td>
                  <td>${sell.sizeSize }</td>
                  <td>${sell.sellPrice }</td>
                  <td>${sell.sellDlvy }</td>
                  <c:choose>
                    <c:when
                      test="${sell.sellCancel == 'N' && (sell.sellDlvy == '판매입찰중' || sell.sellDlvy == '발송요청')}"
                    >
                      <td><button class="cancelBtn btn btn-sm btn-primary" data-id="${sell.sellId }" data-toggle="modal" data-target="#cancelModal">취소신청</button></td>
                    </c:when>
                    <c:otherwise>
                      <td>${sell.sellCancel }</td>
                    </c:otherwise>
                  </c:choose>
                  <c:if test="${sell.sellDlvy }"></c:if>
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
                <a href="prodList.do?page=${pageInfo.startPage-1}">&lt;</a>
              </c:if>
            </li>
            <c:forEach
              var="i"
              begin="${pageInfo.startPage}"
              end="${pageInfo.endPage}"
            >
              <li class="${i == pageInfo.pageNum ? 'active' : ''}">
                <a href="prodList.do?page=${i}">${i}</a>
              </li>
            </c:forEach>
            <li>
              <c:if test="${pageInfo.next}">
                <a href="prodList.do?page=${pageInfo.endPage+1}">&gt;</a>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document).on("click", ".cancelBtn", function () {
	    let cancelId = $(this).data('id');
	    $("#cancelCheck").on("click", function(){
	    	location.href = 'sellCancel.do?id='+cancelId
	    })
	});
</script>
