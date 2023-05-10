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
  <tbody id ="tlist"></tbody>
</table>
</div>
</div>
<script>
			let id = document.createElement('li');
			id.innerText = obj.id;
			document.getElementById('list').append(id);
			let name = document.createElement('li');
			name.innerText = obj.name;
			document.getElementById('list').append(name);

let noteList;
fetch('noteList.do')
.then(resolve => resolve.json())
.then(result => {
	noteList = result.data
	 console.log(noteList);
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
			
  		}
  	})
  	.catch(error =>	console.log(error) )
  	console.log('error',error);
  	
}


document.querySelector("#addComment").addEventListener('click', function(){
	let comment= document.querySelector("#comment").value;	

	let xhtp = new XMLHttpRequest();
    xhtp.open('post','addQC.do');
    xhtp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    xhtp.send("postId=${qnaInfo.postId}&comment=" + comment);
    xhtp.onload = function(){
    	let result =JSON.parse(xhtp.response);
    	console.log(result);
    	document.createElement();



</script>
  <c:forEach var="i" items="${notelist }">
    <tr>
		<td><c:out value="${no=no+1 }"></c:out></td>
		<td class=><div class="col-2 text-truncate" style="max-width: 800px;" ><a href="getNote.do?noteId=${i.noteId}">${i.noteCT }</div></td>
		<td>${i.noteDate}</td>
		<td><button type="button" onclick="location.href='delNote.do';"class="btn btn-danger btn-sm4">삭제</button></td>
    </tr>
   </c:forEach>
   <tr>
  