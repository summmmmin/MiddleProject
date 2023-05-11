<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="site-wrap">
      <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">구매하기</button>
      <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#sellModal" onclick="modalSell()">판매하기</button>
      
      <!-- 판매하기 -->
      <div class="modal fade" id="sellModal" tabindex="-1" aria-labelledby="sellModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="sellModalLabel">판매하기</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="container" id="sizeSelec">                
                <div class="row">
                <c:forEach var="i" begin="0" end="${fn:length(sizeList)-1 }">
                  <div class="col-sm-4">
                    <button type="button" class="btn btn-primary btn-lg btn-block">
                      <c:choose>
                        <c:when test="var == 1">
                          <input type="radio" name="sizes" id="${sizeList[i].sizeId }" checked>
                        </c:when>
                        <c:otherwise>
                          <input type="radio" name="sizes" id="${sizeList[i].sizeId }">
                        </c:otherwise>
                      </c:choose>
                        ${sizeList[i].sizeSize }<br>
                        <c:choose>
                          <c:when test="${not empty priceList[i]}">
                            <span id="var">${priceList[i].buyPrice }</span>
                          </c:when>
                          <c:otherwise>
                            <span id="var">판매입찰</span>
                          </c:otherwise>
                        </c:choose>
                    </button>
                    <br />
                  </div>                	
                </c:forEach>
                </div>
              </div>
              <div class="container" id="priceSelec">
                <div class="row mb-5">
                  <div class="d-grid gap-2 col-6 mx-auto">
                      <div class="btn-group btn-group-toggle" data-toggle="buttons" >
                        <label class="btn btn-secondary active">
                          <input type="radio" name="price" id="option1" checked> 즉시구매
                        </label>
                        <label class="btn btn-secondary">
                          <input type="radio" name="price" id="option2"> 구매입찰
                        </label>
                      </div>
                  </div>                
                </div>
  
                <dl class="row">
                  <dt class="col-sm-3">판매희망가</dt>
                  <dd class="col-sm-9">
                      <input type="text" placeholder="희망가격" onchange="alert(this.value)">
                      <span>원</span>
                  </dd>
                </dl>
                <hr>
                <dl class="row">
                  <dt class="col-sm-3">즉시판매가</dt>
                  <dd class="col-sm-9">
                      500원
                  </dd>
                </dl>
                <hr>
                <dl class="row">
                    <dt class="col-sm-3">검수비</dt>
                    <dd class="col-sm-9">무료</dd>
                </dl>
                <dl class="row">
                  <dt class="col-sm-3">수수료</dt>
                  <dd class="col-sm-9">-</dd>
                </dl>
                <dl class="row">
                  <dt class="col-sm-3">배송비</dt>
                  <dd class="col-sm-9">선불</dd>
                </dl>
                <hr>
                <dl class="row">
                  <dt class="col-sm-3">정산금액</dt>
                  <dd class="col-sm-9">원</dd>
                </dl>
              </div>
            </div>
            <div class="modal-footer" id="fstFoot">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">
                Close
              </button>
              <button type="submit" class="btn btn-primary" onclick="select()">
                구매하기
              </button>
            </div>
            <div class="modal-footer" id="scdFoot">
                <button type="submit" class="btn btn-primary btn-block">
                  구매하기
                </button>
            </div>
          </div>
        </div>
      </div>
</div>
<script>
  function modalSell(){
	  $("#fstFoot").show();
	  $("#sizeSelec").show();
      $("#scdFoot").hide();
      $("#priceSelec").hide();
  }
  function select(){
    var radios = document.getElementsByName('sizes');
    console.log(radios.id)
    var size;
    for (var radio of radios)
    { if (radio.checked) {
        size = radio.id;
        console.log(size)
        console.log(document.getElem)
        //document.getElementById("nextS").innerHTML = "";
      }
    }
    $("#fstFoot").hide();
    $("#sizeSelec").hide();
    $("#priceSelec").show();
    $("#scdFoot").show();
  }
</script>