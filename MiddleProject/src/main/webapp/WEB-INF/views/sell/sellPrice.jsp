<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="site-section">
  <form method="post" action='sellForm.do?pid=${prod.pdtId}&size=${size.sizeId}'>
  <div class="container">
    <div class="row mb-5">
      <div class="col-md-12">
        <div class="border p-4 rounded">
          <table class="table site-block-order-table mb-5">
            <thead>
              <th>상품</th>
              <th>상품명</th>
              <th>사이즈</th>
              <th>브랜드</th>
              <th>판매금액</th>
            </thead>
            <tbody>
              <tr>
                <td width="10%">
                  <img
                    src="images/${prod.pdtImg }"
                    width="100px"
                    height="100px"
                    alt=""
                  />
                </td>
                <td>${prod.pdtNm }</td>
                <td>${size.sizeSize }</td>
                <td>${prod.brdNm }</td>
                <td id="sellprice">-</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div id="priceSelec">
      <div class="row mb-5">
        <div class="btn-group btn-group-toggle" data-toggle="buttons">
          <label
            class="btn btn-secondary active"
            id="1"
            onclick="select(event)"
          >
            <input type="radio" name="selc" id="option1" checked /> 즉시판매
          </label>
          <label class="btn btn-secondary" id="2" onclick="select(event)">
            <input type="radio" name="selc" id="option2" /> 판매입찰
          </label>
        </div>
      </div>

      <dl class="row" id="a">
        <dt class="col-sm-3">판매희망가</dt>
        <dd class="col-sm-9">
          <input
            type="text"
            placeholder="희망가격"
            id="inputPrice"
            name="inPrice"
            onchange="insertPrice()"
          />
          <span>원</span>
        </dd>
      </dl>

      <dl class="row" id="b">
        <dt class="col-sm-3">즉시판매가</dt>
        <dd class="col-sm-9">
          <input
            type="text"
            id="price"
            name="price"
            value="${price.buyPrice}"
            readonly
          />원
        </dd>
      </dl>
      <hr />
      <dl class="row">
        <dt class="col-sm-3">검수비</dt>
        <dd class="col-sm-9">무료</dd>
      </dl>
      <dl class="row">
        <dt class="col-sm-3">수수료</dt>
        <dd class="col-sm-9"><span id="fee">-</span></dd>
      </dl>
      <dl class="row">
        <dt class="col-sm-3">배송비</dt>
        <dd class="col-sm-9">선불</dd>
      </dl>
      <hr />
      <dl class="row">
        <dt class="col-sm-3">정산금액</dt>
        <dd class="col-sm-9"><span id="totalPrice">-</span></dd>
      </dl>
      <button class="btn btn-primary btn-block" onclick="sellBtn()">
        판매하기
      </button>
    </div>
  </div>
  <div class="container" id="sellForm">
    <div class="row mb-5">
      <div class="col-md-12">
        <div class="row mb-5">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">정산계좌</h2>
            <div class="p-3 p-lg-5 border">
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="acc_name" class="text-black">이름 </label>
                  <input
                    type="text"
                    class="form-control"
                    id="acc_name"
                    name="acc_named"
                    value="${user.userNm }"
                  />
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="acc" class="text-black">계좌 </label>
                  <input type="text" class="form-control" id="acc" name="acc" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  
    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">판매</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5">
            <thead>
              <th>상품금액</th>
              <th>
                <input
                  type="number"
                  style="border: none"
                  readonly
                  name="sprice"  
                  value="0"    
                />원
              </th>
            </thead>
            <tbody>
              <tr>
                <td><strong class="mx-2">수수료</strong></td>
                <td>-<span id="sfee"></span></td>
              </tr>
              <tr>
                <td><strong>배송비</strong></td>
                <td>선불</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>총 정산금액</strong>
                </td>
                <td class="text-black font-weight-bold">
                  <input
                    type="number"
                    style="border: none"
                    readonly
                    id="stotalPrice"
                    name="stotal"
                  />원
                </td>
              </tr>
            </tbody>
          </table>

          <div class="form-group">
            <button type="submit"
              class="btn btn-primary btn-lg py-3 btn-block">
              판매하기
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
  let price;
  let fee;
  let totalPrice;

  $(function () {
	  $("#sellForm").hide();
    if (!"${price}") {
      //값이없을때 -> 판매입찰만가능
      test2();
    } else {
      //값이 있을때 -> 즉시판매로이동
      test1();
    }
  });
  function select(event) {
    console.log(event.target.id);
    console.log(document.getElementById("1").classList[2]);
    if (
      event.target.id == "1" &&
      document.getElementById("1").classList[2] != "disabled"
    ) {
      //즉시판매
      $("#a").hide();
      $("#b").show();
      price = "${price.buyPrice}";
      document.getElementById("inputPrice").value = "";
      calcul(price);
    } else if (event.target.id == "2") {
      //판매입찰
      $("#a").show();
      $("#b").hide();
      document.getElementById("fee").innerHTML = "-";
      document.getElementById("totalPrice").innerHTML = "-";
      document.getElementById("inputPrice").value = "";
    }
  }
  // 즉시판매로 넘어가기
  function test1() {
    document.getElementById("2").classList.remove("active");
    document.getElementById("1").focus();
    document.getElementById("1").classList.add("active");
    $("#a").hide();
    $("#b").show();
    price = "${price.buyPrice}";
    document.getElementById("inputPrice").value = "";
    calcul(price);
  }
  // 판매입찰만가능
  function test2() {
    document.getElementById("1").classList.remove("active");
    document.getElementById("2").focus();
    document.getElementById("2").classList.add("active");
    document.getElementById("1").classList.add("disabled");
    $("#a").show();
    $("#b").hide();
    document.getElementById("fee").innerHTML = "-";
    document.getElementById("totalPrice").innerHTML = "-";
    document.getElementById("inputPrice").value = "";
  }
  // 판매입찰입력
  function insertPrice() {
    console.log(document.getElementById("inputPrice").value);
    let inputPrice = document.getElementById("inputPrice").value;

    if (
      Number(inputPrice) <= Number("${price.buyPrice}") &&
      Number(inputPrice) > 0
    ) {
      test1();
    } else {
      price = inputPrice;
      calcul(price);
    }
  }
  // 가격계산
  function calcul(price) {
    fee = Math.round(price * 0.02);
    totalPrice = price - fee;
    document.getElementById("price").innerHTML = price + "원";
    document.getElementById("fee").innerHTML = "-" + fee;
    document.getElementById("totalPrice").innerHTML = totalPrice + "원";
  }
  // 판매하기 버튼
  function sellBtn() {
    console.log(price);
    if (Number(price) <= 0 || price == "" || price == null) {
      alert("입력하세요");
    } else {
    	console.log(document.getElementsByName("sprice"))
    	document.getElementById("stotalPrice").value = totalPrice;
    	document.getElementById("sfee").innerText = fee;
    	document.getElementsByName("sprice")[0].value = price;
    	document.getElementById("sellprice").innerText = price+'원';
    	$('#priceSelec').hide();
    	$("#sellForm").show();
      	
    }
  }
</script>
