<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="site-section">
<div class= container>
<c:set var = "no" value="0"></c:set>
<h3>쪽지함</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col" class ="text-primary" >No.</th>
      <th scope="col" class ="text-primary">내용</th>
      <th scope="col" class ="text-primary">DATE</th>
      <th><button type="button" onclick=""class="btn btn-danger btn-sm4">전체삭제</button></th>
    </tr>
  </thead>
  
  <tbody id ="tlist">
 	
	</tbody>
</table>
</div>
</div>
<script>



let xhtp = new XMLHttpRequest(); //Ajax 호출.
xhtp.open('get','noteList.do?userId=${userInfo.userId}');
xhtp.send();
xhtp.onload = function(){
	console.log(xhtp.response);

	let result = JSON.parse(xhtp.response);
	let tlist = document.getElementById('tlist');  

		for (let i=0; i<result.length;i++){
			let tr = document.createElement('tr');
			let td = document.createElement('td');
			td.innerText = result[i].i;
			
			td = document.createElement('td');
			td.innerText = result[i].noteCT;
			tr.append(td);
			
			td = document.createElement('td');
			td.innerText = result[i].noteDate;
			tr.append(td);
			
			td = document.createElement('td');
			td.innerText = result[i].noteDate;
			tr.append(td);
			
			let btn = document.createElement('button');
			btn.addEventListener('click', function(){
				fetch('delNote.do')
				.then( resolve => resolve.json() ) 
				
				btn.parentElement.parentElement.remove(); // 제거
				
			});
			btn.innerText = '삭제';
			td = document.createElement('td');
			td.append(btn);
			tr.append(td);
			
			tlist.append(tr);
			
			
		}
		
		
	}
			
</script>
  