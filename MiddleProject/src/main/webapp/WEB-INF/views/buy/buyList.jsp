<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="bg-light py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-12 mb-0">
        <a href="index.html">Home</a> <span class="mx-2 mb-0">/</span>
        <strong class="text-black">구매내역</strong>
      </div>
    </div>
  </div>
</div>

<div class="site-section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy1" value="구매입찰중" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy1">구매입찰중</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy2" value="입고대기" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy2">입고대기</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy3" value="입고완료" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy3">입고완료</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy4" value="검수중" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy4">검수중</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy5" value="검수합격" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy5">검수합격</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy6" value="검수불합격" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy6">검수불합격</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy7" value="거래실패" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy7">거래실패</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy8" value="배송준비중" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy8">배송준비중</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy9" value="배송중" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy9">배송중</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy10" value="배송완료" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy10">배송완료</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input dlvy" type="checkbox" id="dlvy11" value="구매취소" onclick="state(this)">
  		  <label class="form-check-label" for="dlvy11">구매취소</label>
		</div>
      <hr>
      </div>
    </div>
    
    <div class="row">
      <div class="col-md-12">
        <div class="form-check form-check-inline">
  		  <input class="form-check-input canc" type="checkbox" id="canc1" value="취소신청" onclick="state(this)">
  		  <label class="form-check-label" for="canc1">취소신청</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input canc" type="checkbox" id="canc2" value="취소완료" onclick="state(this)">
  		  <label class="form-check-label" for="canc2">취소완료</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input canc" type="checkbox" id="canc3" value="취소실패" onclick="state(this)">
  		  <label class="form-check-label" for="canc3">취소실패</label>
		</div>
		<hr>
      </div>
    </div>
    
    <div class="row">
      <div class="col-md-12">
        <div class="form-check form-check-inline">
  		  <input class="form-check-input rtn" type="checkbox" id="rtn1" value="반품신청" onclick="state(this)">
  		  <label class="form-check-label" for="rtn1">반품신청</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input rtn" type="checkbox" id="rtn2" value="반품완료" onclick="state(this)">
  		  <label class="form-check-label" for="rtn2">반품완료</label>
		</div>
		<div class="form-check form-check-inline">
  		  <input class="form-check-input rtn" type="checkbox" id="rtn3" value="반품거부" onclick="state(this)">
  		  <label class="form-check-label" for="rtn3">반품거부</label>
		</div>
		<hr>
      </div>
    </div>
    
    <div class="row">
      <div class="col-md-12">
        <div class="site-blocks-table">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col"></th>
                <th scope="col">구매번호</th>
                <th scope="col">구매일자</th>
                <th scope="col">상품</th>
                <th scope="col">브랜드</th>
                <th scope="col">사이즈</th>
                <th scope="col">가격</th>
                <th scope="col">상태</th>
                <th scope="col">취소</th>
                <th scope="col">반품</th>
              </tr>
            </thead>
            <tbody id="tbody">
            
            </tbody>
            <tbody class="template" style="display:none;">
              
                <tr id="${buy.buyId }">
                  <th scope="row"> </th>
                  <td><a href="buyDetail.do?buyId=${buy.buyId }">${buy.buyId }</a></td>
                  <td>${buy.buyDate }</td>
                  <td>${buy.pdtNm }</td>
                  <td>${buy.brdNm }</td>
                  <td>${buy.sizeSize }</td>
                  <td>${buy.buyPrice }</td>
                  <td>${buy.buyDlvy }</td>
                  <td>${buy.buyCancel }</td>
                  <td>${buy.buyReturn }</td>
                </tr>
              
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
                <a href="buyListU.do?page=${pageInfo.startPage-1}">&lt;</a>
              </c:if>
            </li>
            <c:forEach
              var="i"
              begin="${pageInfo.startPage}"
              end="${pageInfo.endPage}"
            >
              <li class="${i == pageInfo.pageNum ? 'active' : ''}">
                <a href="buyListU.do?page=${i}">${i}</a>
              </li>
            </c:forEach>
            <li>
              <c:if test="${pageInfo.next}">
                <a href="buyListU.do?page=${pageInfo.endPage+1}">&gt;</a>
              </c:if>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', state(this));
let showFields = ['buyDate','buyDlvy','buyCancel','buyReturn','pdtNm','brdNm','sizeSize','buyPrice']
function state(stt){
	let json;
	let str;
	let page = '${param.page}';
	if(stt.tagName == 'INPUT' || stt.tagName == 'A') {
		let arr = ['dlvy', 'canc', 'rtn'];
		let arr3 = [];
		for(let category of arr) {
			let status = document.querySelectorAll('.'+category);
			let arr2 = [];
			for(let i = 0; i<status.length; i++) {
				if(status[i].checked) {
					arr2.push(status[i].value);
				}
			}
			arr3.push(arr2);
		}
		json = {...arr3};
		str = JSON.stringify(json);
		page = 1;
		if(stt.tagName == 'A') {
			page = stt.className;
		}
		console.log(str);
	}
	
	fetch('getBuyList.do', {
		method: 'POST',
        body: 'data='+str+ '&page='+page,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
	})
	.then(result => result.json())
	.then(resolve => {
		document.querySelector('#tbody').innerHTML = '';
		let i = 1
		resolve.list.forEach(item => {
			let tr = document.createElement('tr');
			let th = document.createElement('th');				
			let td = document.createElement('td');
			th = document.createElement('th');	
			th.innerText = i;
			tr.append(th);
			i+=1;
			td = document.createElement('td');
			td.innerText = '<a href = '
			tr.append(td);
			for(let prop of showFields){
				td = document.createElement('td');
				td.innerText = item[prop];
				tr.append(td);
				
			}
			document.querySelector('#tbody').append(tr);	
		})
		let page = document.querySelector('#page');
		let ul = page.querySelector('ul');
		ul.innerHTML = ''; // 초기화
		let li = document.createElement('li');
		let a = document.querySelector('#test11').cloneNode(true);
		if (resolve.pageInfo.prev) {
			a.className = (resolve.pageInfo.startPage-1);
			
			li.append(a);
			a.innerText = '<';
		}
		ul.append(li);
		for (let i = resolve.pageInfo.startPage; i<resolve.pageInfo.endPage; i++) {
			li = document.createElement('li'); // 초기화
			a = document.querySelector('#test11').cloneNode(true); // 초기화
			li.className = (i == resolve.pageInfo.pageNum ? 'active' : '');
			a.className = (i);
			a.innerText = (i);
			li.append(a);
			ul.append(li);
		}
		li = document.createElement('li');
		a = document.querySelector('#test11').cloneNode(true);
		if (resolve.pageInfo.next) {
			a.className = (resolve.pageInfo.endPage+1);
			
			li.append(a);
			a.innerText = '>';
		}
		ul.append(li);
})
.catch(err => console.log(err))
}
</script>
