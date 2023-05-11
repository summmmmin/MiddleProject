<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<style>
  .btn {
    float: right;
  }
</style>

<div class="bg-light py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-12 mb-0">
        <a href="main.do">Home</a> <span class="mx-2 mb-0">/</span>
        <strong class="text-black">구매상세</strong>
      </div>
    </div>
  </div>
</div>

<div class="site-section">
  <div class="container" id="buyDetail">
    <!--구매내역-->
    <div class="row mb-5">
      <div class="col-md-12">
        <div class="border p-2 rounded">
          <table class="table site-block-order-table">
            <tbody>
              <tr id="buyNo">
                <td class="text-black font-weight-bold">
                  <strong>구매번호</strong>
                </td>
                <td class="text-black">${buyInfo.buyId}</td>
                <td class="text-black font-weight-bold">
                  <strong>구매일자</strong>
                </td>
                <td class="text-black font-weight-bold">
                  <strong>${buyInfo.buyDate}</strong>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">배송 정보</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5" id="table">
            


          </table>
        </div>
      </div>
    </div>

    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">구매상품</h2>
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
                <td width="10%">
                  <img src="images/"+"${buyInfo.pdtImg}" width="100px"
                  height="100px" alt="" />
                </td>
                <td>${buyInfo.pdtNm}</td>
                <td>${buyInfo.sizeSize}</td>
                <td>${buyInfo.brdNm}</td>
                <td>${buyInfo.buyPrice}</td>
                <td>${buyInfo.buyDlvy}</td>
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
            <tbody>
              <tr>
                <td class="text-black font-weight-bold" width="30%">
                  <strong>상품금액</strong>
                </td>
                <td class="text-black font-weight-bold">
                  <strong>${buyInfo.buyPrice}원</strong>
                </td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>할인금액</strong>
                </td>
                <td>-</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>포인트사용</strong>
                </td>
                <td>-${buyInfo.buyPoint}</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>수수료</strong>
                </td>
                <td id="fee">-</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>배송비</strong>
                </td>
                <td>+2500원</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>총 결제금액</strong>
                </td>
                <td class="text-black font-weight-bold">
                  <strong>${buyInfo.buyFincost}원</strong>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <table class="table site-block-order-table mb-5" style="display: none">
    <tbody id="delivery">
      <tr>
        <td class="text-black font-weight-bold" width="30%">
          <strong>운송장번호</strong>
        </td>
        <td class="text-black">
          ${buyInfo.dlvNum}(${buyInfo.buyDlvy})
        </td>
      </tr>
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
  <table class="table site-block-order-table mb-5" style="display: none">
    <tbody id="template">
      <tr>
        <td class="text-black font-weight-bold" width="30%">
          <strong>운송장번호</strong>
        </td>
        <td class="text-black">${buyInfo.dlvNum}(${buyInfo.buyDlvy})</td>
      </tr>
      <tr>
        <td class="text-black font-weight-bold" width="30%">
          <strong>받는분</strong>
        </td>
        <td class="text-black"><input type="text" /></td>
      </tr>
      <tr>
        <td class="text-black font-weight-bold">
          <strong>휴대폰</strong>
        </td>
        <td class="text-black"><input type="text" /></td>
      </tr>
      <tr>
        <td class="text-black font-weight-bold">
          <strong>배송지주소</strong>
        </td>
        <td class="text-black"><input type="text" /></td>
      </tr>
    </tbody>
  </table>
</div>

<script>
    let price = '${buyInfo.buyPrice}';
    let fee = Math.round(price * 0.01);
    document.getElementById("fee").innerHTML='+'+fee+'원';
    const arr = ['구매입찰중','입고대기','검수중','검수합격','상품준비중','배송준비중']

    console.log(document.querySelector('#delivery'))

    fetch('buyGet.do',{
      method:'POST',
      headers:{'Content-Type':'application/x-www-form-urlencoded'},
      body: 'buyId='+${param.buyId}
    })
    .then(resolve=>resolve.json())
    .then(result=>{
      //배송지 수정버튼
   let table = document.querySelector('#table');
      let tbody = makeTbody(result);
      console.log(tbody)
      table.append(tbody);

    })

    function makeTbody(dlv){
    	let tbody = document.querySelector('#delivery').cloneNode(true);
    	console.log(dlv)
    	console.log(arr.includes(dlv.buyDlvy))
    	//배송지 수정 버튼
    	if(arr.includes(dlv.buyDlvy)){
    		console.log(arr.includes(dlv.buyDlvy))
    	  	let btn = document.createElement('button');
    	      btn.classList.add('btn');
    	      btn.classList.add('btn-primary');
    	      btn.innerText='수정';
    	      document.getElementById("table").parentElement.append(btn);
    	      btn.addEventListener('click', function(e){

    	    	  let template = document.querySelector('#template').cloneNode(true);
    	    	  template.children[1].children[1].children[0].value = dlv.dlvName;
    	    	  template.children[2].children[1].children[0].value = dlv.dlvPhone;
    	    	  template.children[3].children[1].children[0].value = dlv.dlvAddr;
    	    	  btn.remove();
    	    	  let btn1 = document.createElement('button');
    	    	  btn1.classList.add('btn');
        	      btn1.classList.add('btn-primary');
        	      btn1.innerText='등록';
        	      document.getElementById("table").parentElement.append(btn1);
        	      btn1.addEventListener('click',function(e){
        	    	  
        	    	  let nm = this.parentElement.children[0].children[0].children[1].children[1].children[0].value;
        	    	  let ph = this.parentElement.children[0].children[0].children[2].children[1].children[0].value;
        	    	  let addr = this.parentElement.children[0].children[0].children[3].children[1].children[0].value;
        	    	  fetch('modifyDlvy.do',{
        	    	      method:'POST',
        	    	      headers:{'Content-Type':'application/x-www-form-urlencoded'},
        	    	      body: 'dlvName='+nm+'&dlvPhone='+ph+'&dlvAddr='+addr+'&dlvNum='+dlv.dlvNum+'&dlvId='+dlv.dlvId+'&bid='+dlv.buyId
        	    	    })
        	    	    .then(resolve=>resolve.json())
        	    	    .then(result=>{
        	    	    	console.log(result.data)
        	    	      if(result.retCode == 'Success'){
        	    	    	  let tbody = makeTbody(result.data);
        	    	    	  table.replaceChild(tbody,template);
        	    	    	  btn1.remove();
        	    	      }else if(result.retCode =='Fail'){
        	    	    	  alert('처리 중 에러')
        	    	      }else{
        	    	    	  alert('알 수 없는 반환값')
        	    	      }

        	    	    })
        	    	  })
        	      document.getElementById('table').replaceChild(template, tbody);
        	      })
    	      }
    	if(dlv.buyDlvy == '배송완료'){
    		
    	}
    	tbody.children[1].children[1].innerText=dlv.dlvName;
    	tbody.children[2].children[1].innerText=dlv.dlvPhone;
    	tbody.children[3].children[1].innerText=dlv.dlvAddr;
    	return tbody;
    	}
</script>
