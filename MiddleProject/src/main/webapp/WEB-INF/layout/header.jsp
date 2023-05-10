<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String userId = (String)session.getAttribute("UserId");
    String userNm = (String)session.getAttribute("UserNm");
%>
<header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
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
                  <li><a href="mypagePw.do"><span class="icon icon-person"></span></a></li>
                  <li><a href="cart.html"><span class="icon icon-heart-o"></span></a></li>
                  <li><a href="noteList.do" class="site-cart"><span class="icon icon-send"></span>
                    <span class="count" >5</span></a></li>
                  <li>
                    <a href="#" class="site-cart">
                      <span class="icon icon-message"></span>
                      <span class="count">2</span>
                    </a>
                  </li> 
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
            <li class="has-children active">
              <a href="main.do">Main</a>
              <ul class="dropdown">
                <li><a href="#">Menu One</a></li>
                <li><a href="#">Menu Two</a></li>
                <li><a href="#">Menu Three</a></li>
                <li class="has-children">
                  <a href="#">Sub Menu</a>
                  <ul class="dropdown">
                    <li><a href="#">Menu One</a></li>
                    <li><a href="#">Menu Two</a></li>
                    <li><a href="#">Menu Three</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="has-children">
              <a href="about.html">Ranking</a>
              <ul class="dropdown">
                <li><a href="#">Menu One</a></li>
                <li><a href="#">Menu Two</a></li>
                <li><a href="#">Menu Three</a></li>
              </ul>
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
