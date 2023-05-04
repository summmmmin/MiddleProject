<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">
 </head>
 <body>
   <div class=container>
	<h3>Q&A 등록</h3>

	<form action="qnaAdd.do" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th scope="col" class="text-primary">카테고리</th>
				<td>
					<div class="form-row align-items-center">
						<div class="col-auto my-1">
							<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>Choose...</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">세부 카테고리</th>
				<td><div class="form-row align-items-center">
						<div class="col-auto my-1">
							<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>Choose...</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">상품 이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">상품 가격</th>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">브랜드</th>
				<td><div class="form-row align-items-center">
						<div class="col-auto my-1">
							<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								<option selected>Choose...</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div></td>
			</tr>
			<tr>
				<th scope="col" class="text-primary">첨부파일</th>
				<td><input type="file" name="img"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">등록</button>
					<button type="reset">삭제</button>
				</td>
			</tr>
		</table>
	</form>
</div>
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