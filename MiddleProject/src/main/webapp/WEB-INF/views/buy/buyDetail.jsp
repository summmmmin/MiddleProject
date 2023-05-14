<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
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
    <c:if test=""></c:if>
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
          <table class="table site-block-order-table mb-5" id="table"></table>
        </div>
      </div>
    </div>
	
	
	<c:if test="${userinfo.userGrade == '관리자'}">
    <div class="row mb-5">
      <div class="col-md-12">
        <h2 class="h3 mb-3 text-black">배송 상세</h2>
        <div class="p-3 p-lg-5 border">
          <table class="table site-block-order-table mb-5" id="table1">
             <thead id="delivery1">
     			<th>배송</th>
      			<th>취소</th>
      			<th>반품</th>
    </thead>
    <tbody>
      <tr id="prod">
      	<td>
        	<div class="form-group">
				<select id="dlvy_state" class="form-control" name="form">
				<option selected id="bdlv">${buyInfo.buyDlvy}</option>
				<option value="구매입찰중">구매입찰중</option>
				<option value="입고대기">입고대기</option>
				<option value="입고완료">입고완료</option>
				<option value="검수중">검수중</option>
				<option value="검수합격">검수합격</option>
				<option value="검수불합격">검수불합격</option>
				<option value="거래실패">거래실패</option>
				<option value="배송준비중">배송준비중</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option>
				<option value="구매취소">구매취소</option>
				</select>
			</div>
		</td>
		<td>
			<div class="form-group">
				<select id="cancel_state" class="form-control">
				<option id="bcanc" selected>${buyInfo.buyCancel}</option>
				<option value="취소신청">취소신청</option>
				<option value="취소완료">취소완료</option>
				<option value="취소실패">취소실패</option>
				</select>
			</div>
		</td>
		<td>
			<div class="form-group">
				<select id="return_state" class="form-control">
				<option selected id="brtn">${buyInfo.buyReturn}</option>
				<option value="반품신청">반품신청</option>
				<option value="반품완료">반품완료</option>
				<option value="반품거부">반품거부</option>
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
                <td id="bdlvy">${buyInfo.buyDlvy}</td>
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
    <c:choose>
      <c:when test="${buyInfo.buyCancel == 'N' && (buyInfo.buyDlvy == '구매입찰중')}">
        <td>
          <button
            class="cancelBtn btn btn-sm btn-primary"
            data-id="${buyInfo.buyId }"
            data-toggle="modal"
            data-target="#cancelModal"
          >
            취소신청
          </button>
        </td>
      </c:when>
      <c:otherwise>
        <td>${buyInfo.buyCancel }</td>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${buyInfo.buyReturn == 'N' && buyInfo.buyDlvy == '배송완료'}">
        <td>
          <button
            class="returnBtn btn btn-sm btn-primary"
            data-id="${buyInfo.buyId }"
            data-toggle="modal"
            data-target="#returnModal"
          >
            반품신청
          </button>
        </td>
      </c:when>
      <c:otherwise>
        <td>${buyInfo.buyReturn }</td>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${buyInfo.buyReturn == 'N' && buyInfo.buyDlvy == '배송완료' && buyInfo.buyReturn == 'N'}">
        <td>
          <button
            class="reviewBtn btn btn-sm btn-primary"
            data-id="${buyInfo.buyId }"
            data-toggle="modal"
            data-target="#reviewModal"
          >
            리뷰쓰기
          </button>
        </td>
      </c:when>
      <c:otherwise>
        <td>리뷰작성완료</td>
      </c:otherwise>
    </c:choose>
  </div>
  
  <table class="table site-block-order-table mb-5" style="display: none">
    <tbody id="delivery">
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
<div class="modal fade" id="reviewModal" aria-hidden="true" style="display: none; z-index: 1060;">
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="reviewModalLabel">리뷰쓰기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
      <div class="row">
        <div class="col-md-12">
          <form action=" " method="post">
            <div class="form-group">
              <input type="text" class="form-control" name="Title"
                  placeholder="제목">
            </div>
            <br>
            <div class="form-group">
              <textarea class="form-control" rows="8" name="Content"
                placeholder="내용"></textarea>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      <button type="button" class="btn btn-primary" id="reviewCheck">등록하기</button>
    </div>
  </div>
</div>
</div>
<script>
   let price = '${buyInfo.buyPrice}';
   let fee = Math.round(price * 0.01);
   document.getElementById("fee").innerHTML='+'+fee+'원';
   const arr = ['구매입찰중','입고대기','입고완료','검수중','검수합격','상품준비중','배송준비중']

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
	    
		//배송 상태 변경
	  function updatedlv(){
		   let seldlvy = document.getElementById("dlvy_state");
		   let dlvy_state = seldlvy.options[seldlvy.selectedIndex].value;
		   
		   let selcanc = document.getElementById("cancel_state");
		   let cancel_state = selcanc.options[selcanc.selectedIndex].value;

       let selrtn = document.getElementById("return_state");
		   let return_state = selrtn.options[selrtn.selectedIndex].value;
       console.log(dlvy_state)
       console.log(cancel_state)
       console.log(return_state)
       console.log(seldlvy.options[seldlvy.selectedIndex].value)
	    	fetch('buyUpdate.do',{
	    		     method:'POST',
	    		     headers:{'Content-Type':'application/x-www-form-urlencoded'},
	    		     body: 'buyId='+${buyInfo.buyId} +'&dlvy='+dlvy_state+'&cancel='+cancel_state+'&buyreturn='+return_state
	    		   })
	    	.then(resolve=>resolve.json())
	    	.then(result=>{
	    		if(result.retCode == 'Success'){
              console.log(result.data)
              document.getElementById("bdlv").innerText=result.data.buyDlvy;
              document.getElementById("bcanc").innerText=result.data.buyCancel;
              document.getElementById("brtn").innerText=result.data.buyReturn;
              document.getElementById("bdlvy").innerText=result.data.buyDlvy;
	    			}else if(result.retCode =='Fail'){
	       	    alert('처리 중 에러')
	       	  }else{
	       	    alert('알 수 없는 반환값')
	       	  }
	      
	    	})
		}		   
	    		   /*/자동사냥 */
	   
	   

   
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
	$(document).on("click", ".reviewBtn", function () {
	    let returnId = $(this).data('id');
	    $("#returnCheck").on("click", function(){
	    	fetch('review.do',{
	    		method:'POST',
	    		headers:{
	    		  'Content-Type':'application/x-www-form-urlencoded'
	    		}, body : 'id='+returnId
	    	})
	    	.then(resolve=>resolve.json())
	    	.then(result=>{
	    		if(result.retCode == 'Success'){
	    			$('#reviewModal').modal("hide");
	    			
	    		} else if(result.retCode == 'Fail'){
	    			alert('처리 중 에러');
	    		} else{
	    			alert('알 수 없는 반환값')
	    		}
	    	})
	    })
	});
	
</script>
