<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<style>
  .btn{
    float:right;
  }
</style>

<div class="bg-light py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-12 mb-0">
        <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span>
        <a href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span>
        <strong class="text-black">판매상세</strong>
      </div>
    </div>
  </div>
</div>

<div class="site-section">
  <div class="container" id="sellDetail">
    <!--판매내역-->
    <div class="row mb-5">
      <div class="col-md-12">
        <div class="border p-2 rounded">
          <table class="table site-block-order-table">
            <tbody>
              <tr id="sellNo">
                <td class="text-black font-weight-bold">
                  <strong>판매번호</strong>
                </td>
                <td class="text-black">12345678</td>
                <td class="text-black font-weight-bold">
                  <strong>판매일자</strong>
                </td>
                <td class="text-black font-weight-bold">
                  <strong>2023-05-05</strong>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">정산 계좌</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5">
            <tbody id="acct">
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>이름</strong>
                </td>
                <td class="text-black">변백현</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>계좌</strong>
                </td>
                <td class="text-black">302-19920506-00</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">배송지 정보</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5">
            <tbody id="delivery">
              <tr>
                <td class="text-black font-weight-bold" width="30%">
                  <strong>받는분</strong>
                </td>
                <td class="text-black">변백현</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>휴대폰</strong>
                </td>
                <td class="text-black">010-1992-0506</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>배송지주소</strong>
                </td>
                <td class="text-black">대구시 중구</td>
              </tr>
            </tbody>
          </table>
          <button class="btn btn-primary">수정</button>
        </div>
      </div>
    </div>

    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">판매상품</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5">
            <thead>
              <th>상품</th>
              <th>상품명</th>
              <th>사이즈</th>
              <th>브랜드</th>
              <th>판매금액</th>
              <th>상태</th>
            </thead>
            <tbody>
              <tr id="prod">
              	<td width="10%"><img src="images/children.jpg" width="100px" height="100px" alt=""></td>
                <td>컨버스핑크</td>
                <td>240</td>
                <td>컨버스</td>
                <td>$250.00</td>
                <td>검수중</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">결제상세</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5">
            <tbody id="payment">
              <tr>
                <td class="text-black font-weight-bold" width="30%">
                  <strong>상품금액</strong>
                </td>
                <td class="text-black font-weight-bold">
                  <strong>$250.00</strong>
                </td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>수수료</strong>
                </td>
                <td>-2500원</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>배송비</strong>
                </td>
                <td>선불</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>총 정산금액</strong>
                </td>
                <td class="text-black font-weight-bold">
                  <strong>$250.</strong>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">발송정보</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5">
            <tbody id="delivery">
              <tr>
                <td class="text-black font-weight-bold" width="30%">
                  <strong>운송장번호</strong>
                </td>
                <td class="text-black">000000</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold" width="30%">
                  <strong>보내는분</strong>
                </td>
                <td class="text-black">변백현</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>휴대폰</strong>
                </td>
                <td class="text-black">010-1992-0506</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>주소</strong>
                </td>
                <td class="text-black">대구시 중구</td>
              </tr>
            </tbody>
          </table>
          <button class="btn btn-primary">수정</button>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  fetch('sellGet.do',{
	  method:'POST',
	  headers:{
		'Content-Type':'application/x-www-form-urlencoded'
	  },
	  	body : 'sellId='+${param.sellId}
  })
  .then(resolve=>resolve.json())
  .then(result=>{
	  console.log(result);
	  document.getElementById("sellNo").children[1].innerText=result.sellId;
	  document.getElementById("sellNo").children[3].children[0].innerText=result.sellDate;
	  document.getElementById("acct").children[1].children[1].innerText=result.sellAccount;
    let btn = document.createElement('button');
    btn.classList.add('btn');
    btn.classList.add('btn-primary');
    if(result.sellDlvy == '발송요청' || result.sellDlvy == '판매입찰중' || result.sellDlvy == '발송완료' || result.sellDlvy == '입고대기' || result.sellDlvy == '입고완료' || result.sellDlvy == '검수중'){
      btn.innerText='수정';
      document.getElementById("acct").parentElement.parentElement.append(btn);
    }
    console.log(btn);
	  let dlvy = document.getElementById("delivery");
    dlvy.children[0].children[1].innerText=result.dlvNm;
    dlvy.children[1].children[1].innerText=result.dlvPhone;
    dlvy.children[2].children[1].innerText=result.dlvAddr;
    let prod = document.getElementById("prod");
    prod.children[0].children[0].src="./images/"+result.pdtImg;
    prod.children[1].innerText=result.pdtNm;
    prod.children[2].innerText=result.sizeSize;
    prod.children[3].innerText=result.brdNm;
    prod.children[4].innerText=result.sellPrice;
    prod.children[5].innerText=result.sellDlvy;
    let payment = document.getElementById("payment");
    payment.children[0].children[1].innerText=result.sellPrice+'원';
    payment.children[1].children[1].innerText='-'+result.sellPrice*0.02+'원';
    payment.children[3].children[1].innerText=result.sellPrice*1.02+'원';
    if((result.sellDlvy == '발송요청' || result.sellDlvy == '판매입찰중') && result.sellCancel == 'N'){
      btn = document.createElement('button');
      btn.classList.add('btn');
      btn.classList.add('btn-primary');
      btn.innerText='취소신청'
      document.getElementById("sellDetail").append(btn);
    }
    if(result.sellDlvy == '발송요청' && result.dlvNum ==0){
      btn = document.createElement('button');
      btn.classList.add('btn');
      btn.classList.add('btn-primary');
      btn.innerText='발송정보 등록'
      document.getElementById("sellDetail").append(btn);
    }
    if(result.dlvNum != 0){
      
    }
  })
  .catch(err=>console.log(err))
</script>