<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="site-wrap">
  <div class="bg-light py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 mb-0"><a href="main.do">Home</a> <span class="mx-2 mb-0">/</span> <strong
            class="text-black">wishList</strong></div>
      </div>
    </div>
  </div>

  <div class="site-section">
    <div class="container">
      <div class="row mb-5">
      <h2 class="h3 mb-4 text-black">관심상품</h2>
        <form class="col-md-12" method="post">
          <div class="site-blocks-table">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th class="product-thumbnail">상품 이미지</th>
                  <th class="product-name">상품</th>
                  <th class="product-remove">삭제</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="product-thumbnail">
                    <img src="images/cloth_1.jpg" alt="Image" class="img-fluid">
                  </td>
                  <td class="product-name">
                    <h2 class="h5 text-black">Top Up T-Shirt</h2>
                  </td>

                  <td><a href="#" class="btn btn-primary btn-sm">X</a></td>
                </tr>
                <tr>
                  <td class="product-thumbnail">
                    <img src="images/cloth_2.jpg" alt="Image" class="img-fluid">
                  </td>
                  <td class="product-name">
                    <h2 class="h5 text-black">Polo Shirt</h2>
                  </td>
                  <td><a href="#" class="btn btn-primary btn-sm">X</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>