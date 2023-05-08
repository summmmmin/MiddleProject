<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div class="container" id="priceSelec">
  <div class="row mb-5">
    
      <div class="btn-group btn-group-toggle" data-toggle="buttons">
        <label class="btn btn-secondary active" id="1" onclick='select(event)'>
          <input type="radio" name="selc" id="option1" checked /> 즉시판매
        </label>
        <label class="btn btn-secondary" id="2" onclick='select(event)'>
          <input type="radio" name="selc" id="option2"/> 판매입찰
        </label>
      </div>
    
  </div>

  <dl class="row" id="a">
    <dt class="col-sm-3">판매희망가</dt>
    <dd class="col-sm-9">
      <input type="text" placeholder="희망가격" id="inputPrice" onchange="insertPrice()" />
      <span>원</span>
    </dd>
  </dl>
  
  <dl class="row" id="b">
    <dt class="col-sm-3">즉시판매가</dt>
    <dd class="col-sm-9"><span id="price">${price.buyPrice}원</span></dd>
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
  <button type="submit" class="btn btn-primary btn-block" onclick="test()">구매하기</button>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	let price;
	let fee;
	let totalPrice;
	
	$(function() {
		if(!'${price}'){	
		  //값이없을때 -> 판매입찰만가능
		  test2();
		}else{
			//값이 있을때 -> 즉시판매로이동
			test1();
			
		}
	})
	  function select(event){
		  console.log(event.target.id)
		  console.log(document.getElementById("1").classList[2])
		  if(event.target.id == '1' && document.getElementById("1").classList[2]!='disabled'){ //즉시판매
			  $("#a").hide();
			  $("#b").show();
			  price = '${price.buyPrice}';
			  calcul(price);
		  }else if(event.target.id == '2'){ //판매입찰
			  $("#a").show();
			  $("#b").hide();
			  document.getElementById("fee").innerHTML='-'
			  document.getElementById("totalPrice").innerHTML='-'
			  document.getElementById("inputPrice").value=''
			  
		  }
	  }
	<!--즉시판매로 넘어가기-->
	function test1(){
		document.getElementById("2").classList.remove('active');
		document.getElementById("1").focus();
		document.getElementById("1").classList.add('active');
		$("#a").hide();
		$("#b").show();
		price = '${price.buyPrice}';
		calcul(price);
	}
	<!--판매입찰만가능-->
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
    <!--판매입찰입력-->
	function insertPrice(){
		console.log(document.getElementById("inputPrice").value)
		let inputPrice = document.getElementById("inputPrice").value

		if(Number(inputPrice) < Number('${price.buyPrice}')){
			test1();
		}else{
			  price = inputPrice;
			  calcul(price);
		}
	}
	<!--가격계산-->
	function calcul(price){
		fee = Math.round(price * 0.02);
		totalPrice = price - fee;
		document.getElementById("price").innerHTML=price+'원';
		document.getElementById("fee").innerHTML='-'+fee;
		document.getElementById("totalPrice").innerHTML=totalPrice+'원';		  
	}
	
</script>
