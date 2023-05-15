<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
  .btn{
    float:right;
  }
</style>

<div class="bg-light py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-12 mb-0">
        <a href="main.do">Home</a> <span class="mx-2 mb-0">/</span>
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
    
    <c:if test="${userinfo.userGrade == '관리자'}">
    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">배송 상세</h2>
        <div class="p-3 p-lg-5 border">
          <p>체결 구매번호 : ${sellInfo.buyId}</p>
          <table class="table site-block-order-table mb-5" id="table1">
             <thead id="delivery1">
     			<th>배송</th>
      			<th>취소</th>
    </thead>
    <tbody>
      <tr id="statetr">
      	<td>
        	<div class="form-group">
				<select id="dlvy_state" class="form-control" name="form">
				<option selected id="sdlv">${sellInfo.sellDlvy}</option>
				<option value="판매입찰중">판매입찰중</option>
				<option value="발송요청">발송요청</option>
				<option value="발송완료">발송완료</option>
				<option value="입고대기">입고대기</option>
				<option value="입고완료">입고완료</option>
				<option value="검수중">검수중</option>
				<option value="검수합격">검수합격</option>
				<option value="검수불합격">검수불합격</option>
				<option value="거래실패">거래실패</option>
				<option value="정산완료">정산완료</option>
				</select>
			</div>
		</td>
		<td>
			<div class="form-group">
				<select id="cancel_state" class="form-control">
				<option id="scanc" selected>${sellInfo.sellCancel}</option>
				<option value="취소신청">취소신청</option>
				<option value="취소완료">취소완료</option>
				<option value="취소실패">취소실패</option>
				</select>
			</div>
		</td>
     </tr>
   	</tbody>
          </table>
           <button type="button" class="btn btn-primary" onclick="updatedlv()">수정</button>
        </div>
      </div>
    </div>	
	</c:if>
    
    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">정산 계좌</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5" id="table"></table>
          <table class="table site-block-order-table mb-5" style="display: none">
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
    <div class="row mb-5" id="dlvyadd">
    <div class="row mb-5" style="display: none;">
      <div class="col-md-12" id="dlvyinfo">
        <h2 class="h3 mb-3 text-black">발송정보</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5">
            <tbody class="delivery">
              <tr>
                <td class="text-black font-weight-bold" width="30%">
                  <strong>운송장번호</strong>
                </td>
                <td class="text-black">-</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold" width="30%">
                  <strong>보내는분</strong>
                </td>
                <td class="text-black">-</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>휴대폰</strong>
                </td>
                <td class="text-black">010---0506</td>
              </tr>
              <tr>
                <td class="text-black font-weight-bold">
                  <strong>주소</strong>
                </td>
                <td class="text-black">-</td>
              </tr>
            </tbody>
          </table>
          <!-- <button class="btn btn-primary">수정</button> -->
        </div>
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

<div class="modal fade" style="top:200px;" id="dlvModal" tabindex="-1" aria-labelledby="dlvModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="dlvModalLabel">발송정보등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <table class="table">
        <tbody>
      <tr>
        <td class="text-black font-weight-bold" width="30%">
          <strong>운송장번호</strong>
        </td>
        <td class="text-black"><input type="text" id="dlvno"/></td>
      </tr>
      <tr>
        <td class="text-black font-weight-bold" width="30%">
          <strong>받는분</strong>
        </td>
        <td class="text-black"><input type="text" id="dlvnm"/></td>
      </tr>
      <tr>
        <td class="text-black font-weight-bold">
          <strong>휴대폰</strong>
        </td>
        <td class="text-black"><input type="text" id="dlvph"/></td>
      </tr>
      <tr>
        <td class="text-black font-weight-bold">
          <strong>배송지주소</strong>
        </td>
        <td class="text-black"><input type="text" id="dlvaddr"/></td>
      </tr>
    </tbody>
    </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="addDlv">등록하기</button>
      </div>
    </div>
  </div>
</div>

<table class="table site-block-order-table mb-5" style="display: none">
  <tbody id="template">
    <tr>
      <td class="text-black font-weight-bold">
        <strong>이름</strong>
      </td>
      <td class="text-black"><input type="text" /></td>
    </tr>
    <tr>
      <td class="text-black font-weight-bold">
        <strong>계좌</strong>
      </td>
      <td class="text-black"><input type="text" /></td>
    </tr>
  </tbody>
</table>
<script>
  const arr = ['발송요청','판매입찰중','발송완료','입고대기','입고완료','검수중']

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
	  /* document.getElementById("acct").children[0].children[1].innerText=result.sellAccountNm;
	  document.getElementById("acct").children[1].children[1].innerText=result.sellAccount;
    let btn = document.createElement('button');
    btn.classList.add('btn');
    btn.classList.add('btn-primary');
    if(result.sellDlvy == '발송요청' || result.sellDlvy == '판매입찰중' || result.sellDlvy == '발송완료' || result.sellDlvy == '입고대기' || result.sellDlvy == '입고완료' || result.sellDlvy == '검수중'){
      btn.innerText='수정';
      document.getElementById("acct").parentElement.parentElement.append(btn);
      btn.addEventListener('click', function(e){
    	  
      })
    } */
    //정산계좌등록
      let table = document.querySelector('#table');
      let tbody = makeTbody(result);
      table.append(tbody);
    
	  /* let dlvy = document.getElementById("delivery");
    dlvy.children[0].children[1].innerText=result.dlvNm;
    dlvy.children[1].children[1].innerText=result.dlvPhone;
    dlvy.children[2].children[1].innerText=result.dlvAddr; */
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
      let btnc = document.createElement('button');
      btnc.classList.add('btn');
      btnc.classList.add('btn-primary');
      btnc.innerText='취소신청';
      document.getElementById("sellDetail").append(btnc);
      btnc.addEventListener('click', function(e){
    	  $('#cancelModal').modal("show");
    	  $("#cancelCheck").on("click", function(){
  	    	
  	    	fetch('sellCancel.do',{
  	    		method:'POST',
  	    		headers:{
  	    		  'Content-Type':'application/x-www-form-urlencoded'
  	    		}, body : 'id='+ result.sellId
  	    	})
  	    	.then(resolve=>resolve.json())
  	    	.then(result=>{
  	    		if(result.retCode == 'Success'){
  	    			$('#cancelModal').modal("hide");
  	    			btnc.remove();
  	    		} else if(result.retCode == 'Fail'){
  	    			alert('처리 중 에러');
  	    		} else{
  	    			alert('알 수 없는 반환값')
  	    		}
  	    	})
  	    	
  	    })
      })
    }
    if(result.sellDlvy == '발송요청' && result.dlvNum ==0){
      let btnd = document.createElement('button');
      btnd.classList.add('btn');
      btnd.classList.add('btn-primary');
      btnd.innerText='발송정보 등록'
      document.getElementById("sellDetail").append(btnd);
      btnd.addEventListener('click', function(e){
    	  $('#dlvModal').modal("show");
    	  $("#addDlv").on("click", function(){
    	    	let num = document.querySelector('#dlvno').value;
    	    	let nm = document.querySelector('#dlvnm').value;
    	    	let ph = document.querySelector('#dlvph').value;
    	    	let addr = document.querySelector('#dlvaddr').value;
    	    	fetch('modifyDlvy.do',{
    	    		method:'POST',
    	    		headers:{
    	    		  'Content-Type':'application/x-www-form-urlencoded'
    	    		}, body : 'dlvName='+nm+'&dlvPhone='+ph+'&dlvAddr='+addr+'&dlvNum='+num+'&dlvId='+result.dlvId+'&bid='+result.sellId
    	    	})
    	    	.then(resolve=>resolve.json())
    	    	.then(result=>{
    	    		if(result.retCode == 'Success'){
    	    			$('#dlvModal').modal("hide");
    	    			btnd.remove();
    	    			console.log(result.data);
    	    			document.querySelector('#dlvyadd').append(makeDlvyInfo(result.data));
    	    		} else if(result.retCode == 'Fail'){
    	    			alert('처리 중 에러');
    	    		} else{
    	    			alert('알 수 없는 반환값')
    	    		}
    	    	})
    	    	
    	    })
      })
    }
    if(result.dlvNum != 0){
      let dlvadd = document.querySelector('#dlvyadd');
      let dlvinfo = makeDlvyInfo(result);
      dlvadd.append(dlvinfo);
           
    }
  })
  .catch(err=>console.log(err))
  
  function makeTbody(account={}){
	   	let tbody = document.querySelector('#acct').cloneNode(true);
	   	//정산계좌 수정 버튼
	   	if(arr.includes(account.sellDlvy)){
	   		console.log('check'+account.sellDlvy)
	   	  	  let btn = document.createElement('button');
	   	      btn.classList.add('btn');
	   	      btn.classList.add('btn-primary');
	   	      btn.innerText='수정';
	   	      document.getElementById("table").parentElement.append(btn);
	   	      btn.addEventListener('click', function(e){
	   	    	  let template = document.querySelector('#template').cloneNode(true);
	   	    	  template.children[0].children[1].children[0].value = account.sellAccountNm;
	   	    	  template.children[1].children[1].children[0].value = account.sellAccount;
	   	    	  btn.remove();
	   	    	  let btn1 = document.createElement('button');
	   	    	  btn1.classList.add('btn');
	       	      btn1.classList.add('btn-primary');
	       	      btn1.innerText='등록';
	       	      document.getElementById("table").parentElement.append(btn1);
	       	      btn1.addEventListener('click',function(e){

	       	    	  let nm = this.parentElement.children[0].children[0].children[0].children[1].children[0].value;
	       	    	  let ac = this.parentElement.children[0].children[0].children[1].children[1].children[0].value;
	       	    	  fetch('modifyAcc.do',{
	       	    	      method:'POST',
	       	    	      headers:{'Content-Type':'application/x-www-form-urlencoded'},
	       	    	      body: 'sellId='+account.sellId+'&sellAcc='+nm+'/'+ac
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
	   	      }else{
	   	    	  
	   	      }
	   	tbody.children[0].children[1].innerText=account.sellAccountNm;
	   	tbody.children[1].children[1].innerText=account.sellAccount;
	   	return tbody;
	   	}
  
  function makeDlvyInfo(dlv){
	  let dlvyinfo = document.querySelector('#dlvyinfo').cloneNode(true);
	  dlvyinfo.children[1].children[0].children[0].children[0].children[1].innerText = dlv.dlvNum;
	  dlvyinfo.children[1].children[0].children[0].children[1].children[1].innerText = dlv.dlvName;
	  dlvyinfo.children[1].children[0].children[0].children[2].children[1].innerText = dlv.dlvPhone;
	  dlvyinfo.children[1].children[0].children[0].children[3].children[1].innerText = dlv.dlvAddr;
	  return dlvyinfo;
  }
  
  function updatedlv(){
	   let seldlvy = document.getElementById("dlvy_state");
	   let dlvy_state = seldlvy.options[seldlvy.selectedIndex].value;
	   
	   let selcanc = document.getElementById("cancel_state");
	   let cancel_state = selcanc.options[selcanc.selectedIndex].value;

   	fetch('sellUpdate.do',{
   		     method:'POST',
   		     headers:{'Content-Type':'application/x-www-form-urlencoded'},
   		     body: 'sellId='+${sellInfo.sellId} +'&dlvy='+dlvy_state+'&cancel='+cancel_state
   		   })
   	.then(resolve=>resolve.json())
   	.then(result=>{
   		if(result.retCode == 'Success'){
         document.getElementById("sdlv").innerText=result.data.sellDlvy;
         document.getElementById("scanc").innerText=result.data.sellCancel;
         document.getElementById("prod").children[5].innerText=result.data.sellDlvy;
   			}else if(result.retCode =='Fail'){
      	    alert('처리 중 에러')
      	  }else{
      	    alert('알 수 없는 반환값')
      	  }
   	})
	}		 
</script>