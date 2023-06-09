<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="site-section">
<div class="container" id="priceSelec">
<form method="post" id="form">
  <div class="row mb-5">
    <div class="btn-group btn-group-toggle" data-toggle="buttons">
      <label class="btn btn-secondary active" id="1" onclick="select(event)">
        <input type="radio" name="selc" id="option1" checked /> 즉시구매
      </label>
      <label class="btn btn-secondary" id="2" onclick="select(event)">
        <input type="radio" name="selc" id="option2" /> 구매입찰
      </label>
    </div>
  </div>

  <dl class="row" id="a">
    <dt class="col-sm-3">구매희망가</dt>
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
    <dt class="col-sm-3">즉시구매가</dt>
    
    <dd class="col-sm-9"><input type="text" id="price" name="price" value="${price.sellPrice}" readonly>원 </dd>
  </dl>
  <hr />
  <dl class="row">
    <dt class="col-sm-3">수수료</dt>
    <dd class="col-sm-9"><span id="fee">-</span></dd>
  </dl>
  <dl class="row">
    <dt class="col-sm-3">배송비</dt>
    <dd class="col-sm-9">+2500원</dd>
  </dl>
  <hr />
  <dl class="row">
    <dt class="col-sm-3">총 금액</dt>
    <dd class="col-sm-9"><span id="totalPrice">-</span></dd>
  </dl>
  <button class="btn btn-primary btn-block" onclick="sellBtn()">
    구매하기
  </button>
</form>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
  let price;
  let fee;
  let totalPrice;

  $(function() {
  	if(!'${price}'){
  	  //값이없을때
  	  test2();
  	}else{
  		//값이 있을때
  		test1();

  	}
  })
    function select(event){
  	  console.log(event.target.id)
  	  console.log(document.getElementById("1").classList[2])
  	  if(event.target.id == '1' && document.getElementById("1").classList[2]!='disabled'){ //즉시구매
  		  $("#a").hide();
  		  $("#b").show();
  		  price = '${price.sellPrice}';
  		  document.getElementById("inputPrice").value='';
  		  calcul(price);
  	  }else if(event.target.id == '2'){ //구매입찰
  		  $("#a").show();
  		  $("#b").hide();
  		  document.getElementById("fee").innerHTML='-';
  		  document.getElementById("totalPrice").innerHTML='-';
  		  document.getElementById("inputPrice").value='';
  	  }
    }
  // 즉시구매로 넘어가기
  function test1(){
  	document.getElementById("2").classList.remove('active');
  	document.getElementById("1").focus();
  	document.getElementById("1").classList.add('active');
  	$("#a").hide();
  	$("#b").show();
  	price = '${price.sellPrice}';
  	document.getElementById("inputPrice").value='';
  	calcul(price);
  }
  // 판매입찰만가능
     function test2(){
     	document.getElementById("1").classList.remove('active');
     	document.getElementById("2").focus();
  	document.getElementById("2").classList.add('active');
  	document.getElementById("1").classList.add('disabled');
  	$("#a").show();
  	$("#b").hide();
  	document.getElementById("fee").innerHTML='-'
  	document.getElementById("totalPrice").innerHTML='-'
  	document.getElementById("inputPrice").value=''
     }
  // 구매입찰입력
  function insertPrice(){
  	console.log(document.getElementById("inputPrice").value)
  	let inputPrice = document.getElementById("inputPrice").value
	if('${price}'){
  		if(Number(inputPrice) >= Number('${price.sellPrice}') && Number(inputPrice)>0){
  			test1();
		}else{
	  		  price = inputPrice;
	  		  calcul(price);
	  		  console.log('input:'+price)
	  	}
  	}else{
  		  price = inputPrice;
  		  calcul(price);
  		  console.log('input:'+price)
  	}		
  }
  // 가격계산
  function calcul(price){
  	fee = Math.round(price * 0.01);
  	totalPrice = Number(price) + Number(fee) + Number(2500);
  	document.getElementById("price").innerHTML=price+'원';
  	document.getElementById("fee").innerHTML='+'+fee;
  	document.getElementById("totalPrice").innerHTML=totalPrice+'원';
  }
  // 버튼
  function sellBtn(){
	  if(Number(price) <= 0 || price=='' || price==null){
		  alert("입력하세요");
		  
	  }else{
		  $('#form').attr("action","buyForm.do?pid=${prodId}&size=${size}").submit();		  
	  }
  }
</script>
