<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<style>
/*관심상품 색*/
.btn-pink {
	color: #fff;
	background-color: #e83e8c;
	border-color: #e83e8c;
}
</style>
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">


<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

</head>
<body>

	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">${prodInfo.pdtNm}</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img src="images/${prodInfo.pdtImg}" alt="Image" class="img-fluid">
					</div>
					<div class="col-md-6">
						<h2 class="text-black">${prodInfo.pdtNm}</h2>
						<p class="mb-4">${prodInfo.brdNm}</p>
						<p>
							<strong class="text-primary h4">${prodInfo.pdtPrice}</strong>
						</p>

						<div class="mb-5">
							<div class="input-group mb-3" style="max-width: 120px;"></div>

						</div>
						<div class="mb-5">
							<button class="btn btn-primary btn-sm" data-toggle="modal"
								data-target="#exampleModal">구매하기</button>
							<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#sellModal">판매하기</button>
							<button class="btn btn-sm btn-pink">관심상품</button>
						</div>
						<div class="mb-5">
							<c:if test="${userinfo.userGrade == '관리자'}">
							<button class="btn btn-sm btn-blue" type="button"
								onclick="location.href='modifyProd.do?pid=${prodInfo.pdtId}'">수정하기</button>
							<button class="btn btn-sm btn-red" type="button"
								onclick="location.href='delProd.do?pid=${prodInfo.pdtId}'">삭제하기</button>
							</c:if>
						</div>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">사이즈 선택</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-sm-4">
												<button type="button"
													class="btn btn-primary btn-lg btn-block">사이즈</button>
												<p></p>
											</div>
											<div class="col-sm-4">
												<button type="button"
													class="btn btn-primary btn-lg btn-block">사이즈</button>
											</div>
											<div class="col-sm-4">
												<button type="button"
													class="btn btn-primary btn-lg btn-block">사이즈</button>
											</div>
											<div class="col-sm-4">
												<button type="button"
													class="btn btn-primary btn-lg btn-block">사이즈</button>
											</div>
											<div class="col-sm-4">
												<button type="button"
													class="btn btn-primary btn-lg btn-block">사이즈</button>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">구매하기</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>Featured Products</h2>
					</div>
				</div>
				<div class="row">
						<div class="col-md-12">
							<div class="nonloop-block-3 owl-carousel">
							 <c:forEach var="product2" items="${product2}" begin="0" end="6">
								<div class="item">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<a
												href="getProd.do?&pid=${prodInfo.pdtId}">
												<img src="images/${product2.pdtImg}" alt="Image placeholder"
												class="img-fluid">
											</a>
										</figure>
										<div class="block-4-text p-4">
											<h3>
												<a
													href="getProd.do?&pid=${prodInfo.pdtId}">${product2.pdtNm}</a>
											</h3>
											<p class="mb-0">${product2.brdId}</p>
											<p class="text-primary font-weight-bold">${product2.pdtPrice}</p>
											<p>${product2.pdtViews}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	      <!-- 판매하기 -->
      <div class="modal fade" id="sellModal" tabindex="-1" aria-labelledby="sellModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="sellModalLabel">판매하기</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="container" id="sizeSelec">                
                <div class="row">
                <c:forEach var="i" begin="0" end="${fn:length(sizeList)-1 }">
                  <div class="col-sm-4">
                    <button type="button" class="btn btn-primary btn-lg btn-block">
                      <c:choose>
                        <c:when test="var == 1">
                          <input type="radio" name="sizes" id="${sizeList[i].sizeId }" checked>
                        </c:when>
                        <c:otherwise>
                          <input type="radio" name="sizes" id="${sizeList[i].sizeId }">
                        </c:otherwise>
                      </c:choose>
                        ${sizeList[i].sizeSize }<br>
                        <c:choose>
                          <c:when test="${not empty priceList[i]}">
                            <span>${priceList[i].buyPrice }</span>
                          </c:when>
                          <c:otherwise>
                            <span>판매입찰</span>
                          </c:otherwise>
                        </c:choose>
                    </button>
                    <br />
                  </div>                	
                </c:forEach>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">
                Close
              </button>
              <button type="submit" class="btn btn-primary" onclick="sizeSelc()">
                판매하기
              </button>
            </div>
          </div>
        </div>
      </div>
      
    <script>
      function sizeSelc(){
    	  var radios = document.getElementsByName('sizes');
    	  var size;
    	  for (var radio of radios){
    		  if (radio.checked) {
      	        size = radio.id;
      	        console.log(size)
      	        
      	      }
    	  }
    	  location.href='sellPrice.do?prodId=${prodInfo.pdtId}&size='+size;
      }
    </script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>

	<script src="js/main.js"></script>

</body>
</html>