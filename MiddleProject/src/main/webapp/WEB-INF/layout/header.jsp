<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String userId = (String)session.getAttribute("UserId");
    String userNm = (String)session.getAttribute("UserNm");
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.count{	 
          font-size: 16px;
          width: 26px;
          height: 26px;
          line-height: 26px;
          border-radius: 50%;
          display: inline-block;
          text-align: center;
          background: #7971ea;
          color: #fff;
    }
.overlay {
  height: 100%;
  width: 100%;
  display: none;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: rgb(255,255,255);
  background-color: rgba(255,255,255, 0.9);
}

.overlay-content {
  position: relative;
  top: 20%;
  width: 80%;
  text-align: center;
  margin-top: 30px;
  margin: auto;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
  cursor: pointer;
  color: black;
}

.overlay .closebtn:hover {
  color: #ccc;
}

.overlay input[type=text] {
  padding: 15px;
  font-size: 17px;
  border: none;
  float: left;
  width: 80%;
  background: white;
}

.overlay input[type=text]:hover {
  background: #f1f1f1;
}

.overlay button {
  float: left;
  width: 20%;
  padding: 15px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.overlay button:hover {
  background: #bbb;
}
<body>
</style>
<header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">
          
          <div id="myOverlay" class="overlay">
  <span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
  <div class="overlay-content">
    <form action="/action_page.php">
      <input type="text" placeholder="상품명,브랜드명" name="search">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</div>

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span onclick="openSearch()" class="icon icon-search"></span>
                <input type="text" class="form-control border-0" placeholder="검색">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="main.do" class="js-logo-clone">크림발라드림</a>
              </div>
            </div>

        <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
                  <li><a href="mypagePwForm.do"><span class="icon icon-person"></span></a></li>
                  <li><a href="wishList.do"><span class="icon icon-heart-o"></span></a></li>
                  <c:if test="${userinfo != null}">
                  <li><a href="noteList.do" class="site-cart"><span class="icon icon-send"></span>
                    <span class="count" >${readInfo }</span></a></li>
                   </c:if>
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-left" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li>
              <a href="main.do">Main</a>
            </li>
            <li><a href="prodList.do">Shop</a></li>
            <li><a href="qnaList.do">Q&A</a></li>
            <c:choose>
              <c:when test="${userinfo == null }">
                  <li id="fright"><a href="loginForm.do">Login</a></li>
              </c:when>
              <c:otherwise>
                  <li id="fright"><a href="logout.do">Logout</a></li>
              </c:otherwise>
          </c:choose>
          </ul>
        </div>
      </nav>
    </header>
    
 <script>
    function openSearch() {
    	  document.getElementById("myOverlay").style.display = "block";
    	}

    	function closeSearch() {
    	  document.getElementById("myOverlay").style.display = "none";
    	}
 </script>
