<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style>
  .card {
    padding: 10px;
  }
  
  body {
    margin: 10px;
  }
</style>
<div id="content" class="flex">
   <div class="">
      <div class="page-content page-container" id="page-content">
         <div class="padding">
            <div class="row justify-content-center">
               <div class="col-md-3">
                 <div class="card">
                   <div class="card-header"><strong>로그인</strong></div>
                     <div class="card-body">
                       <form>
                         <div class="form-group">
                           <label class="text-muted" for="exampleInputEmail1">아이디</label>
                           <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder=""> 
              			   <small id="emailHelp" class="form-text text-muted">아이디는 이메일 형식입니다</small>

                         </div>
                         <div class="form-group">
                           <label class="text-muted" for="exampleInputPassword1">비밀번호</label>
                           <input type="password" class="form-control" id="exampleInputPassword1" placeholder=""> 

                         </div>
                         <button type="submit" class="btn btn-primary">로그인</button>
                       </form>
                     </div>
                   </div>
               </div>
             </div>
         </div>
      </div>
   </div>
</div>
</head>