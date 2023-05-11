<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
 #ss{
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

.table
#tlist{

}
#ss2{
} 
</style>


<div class="site-section">
<div class= container>
<c:set var = "no" value="0"></c:set>
<h3>쪽지함</h3>
<table class="table table-striped" style="width:1000px;">
  <thead>
    <tr>
      <th scope="col" class ="text-primary" >No.</th>
      <th scope="col" class ="text-primary">내용</th>
      <th  scope="col" class ="text-primary" style="width:140px;">DATE</th>
      <th><button type="button" onclick="" class="btn btn-danger btn-sm4">전체삭제</button></th>
    </tr>
  </thead>
  
  <tbody id ="tlist">
 	
	</tbody>
</table>
<div class="center">
    <div class="pagination justify-content-center">
		<c:if test="${pageInfo.prev }">
			<a  class="page-link" href="listNote.do?page=${pageInfo.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<a  class="page-link" class="${i == pageInfo.pageNum ? 'active' : '' }" href="listNote.do?page=${i }">${i } </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a  class="page-link" href="listNote.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
</div>
</div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

console.log('${userinfo.userId}');



let xhtp = new XMLHttpRequest(); //Ajax 호출.
xhtp.open('get','noteList.do');
xhtp.send();
xhtp.onload = function(){

	console.log(xhtp.response);
	let result = JSON.parse(xhtp.response);
	console.log(result);
	let tlist = document.getElementById('tlist');  
		for (let i=0; i<result.length;i++){
			let tr = document.createElement('tr');
			let td = document.createElement('td');
			let div = document.createElement('div');
			td.innerText = i+1;
			tr.append(td);
			
			td = document.createElement('td');
			td.id= result[i].noteId;
			td.innerText = result[i].noteCT;
		
			tr.append(td);
			
			td = document.createElement('td');
			td.innerText = result[i].noteDate;
			tr.append(td);
			
			let btn = document.createElement('button');
			btn.addEventListener('click', function(){
				btn.parentElement.parentElement.remove(); // 제거
				console.log(btn.parentElement.parentElement);
				
				let 삭제글번호 = result[i].noteId;
				console.log(삭제글번호);
				let xhtp = new XMLHttpRequest();
				xhtp.open('post','delNote.do');
				xhtp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
				xhtp.send('noteId=' + 삭제글번호);// 요청방식post일 경우에 parameter를 send() 포함.

				xhtp.onload = function(){
					let result = JSON.parse(xhtp.response);
					if(result.retCode== 'Success'){
						alert('삭제완료')
						btn.parentElement.parentElement.remove();
					}else if(result.retCode== 'Fail'){
						alert('처리중 에러발생');

					}else{
						alert('알수없는 결과값입니다.');
					}
				}		
			});
			btn.innerText = '삭제';
			td = document.createElement('td');
			td.append(btn);
			tr.append(td);
			
			tlist.append(tr);
		
			
		}
		
	}
	
	
			
</script>
  