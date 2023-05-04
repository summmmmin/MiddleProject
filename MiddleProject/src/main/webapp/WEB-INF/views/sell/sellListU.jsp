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
                  <td>${sell.sellId }</td>
                  <td>${sell.sellDate }</td>
                  <td>${sell.pdtNm }</td>
                  <td>${sell.pdtBrand }</td>
                  <td>${sell.sizeSize }</td>
                  <td>${sell.sellPrice }</td>
                  <td>${sell.sellConfirm }</td>
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
          <c:if test="${pageInfo.prev }">
            <a class="page-link" href="sellListU.do?page=${pageInfo.startPage-1 }"
              >previous</a
            >
          </c:if>
          <c:forEach
            var="i"
            begin="${pageInfo.startPage }"
            end="${pageInfo.endPage }"
          >
            <a
              class="page-link"
              class="${i == pageInfo.pageNum ? 'active' : '' }"
              href="sellListU.do?page=${i }"
              >${i }
            </a>
          </c:forEach>
          <c:if test="${pageInfo.next }">
            <a class="page-link" href="sellListU.do?page=${pageInfo.endPage+1 }&userId=${userInfo.id}"
              >Next</a
            >
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
