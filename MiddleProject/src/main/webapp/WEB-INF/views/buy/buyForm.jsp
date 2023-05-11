<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<div class="site-section">
        <div class="container">
          <div class="row mb-5">
            <div class="col-md-12">
              <div class="border p-4 rounded">
                <table class="table site-block-order-table mb-5">
                  <thead>
                    <th>상품</th>
                    <th>상품명</th>
                    <th>사이즈</th>
                    <th>브랜드</th>
                    <th>판매금액</th>
                    <th>상태</th>
                  </thead>
                  <tbody>
                    <tr>
                      <td width="10%">
                        <img src="images/"+"cloth_1.jpg" width="100px"
                        height="100px" alt="" />
                      </td>
                      <td>컨버스핑크</td>
                      <td>240</td>
                      <td>컨버스</td>
                      <td>$250.00</td>
                      <td>검수중</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-5 mb-md-0">
              <div class="row mb-5">
                <div class="col-md-12">
                  <h2 class="h3 mb-3 text-black">배송지</h2>
                  <div class="p-3 p-lg-5 border">
                    <div class="form-group row">
                      <div class="col-md-12">
                        <label for="c_companyname" class="text-black">Name </label>
                        <input type="text" class="form-control" id="c_companyname" name="c_companyname">
                      </div>
                    </div>
                    <div class="form-group row">
                      <div class="col-md-12">
                        <label for="c_companyname" class="text-black">Phone </label>
                        <input type="text" class="form-control" id="c_companyname" name="c_companyname">
                      </div>
                    </div>
                    <div class="form-group row">
                      <div class="col-md-12">
                        <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_address" name="c_address" placeholder="Street address">
                        <input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mb-5">
                <div class="col-md-12">
                  <h2 class="h3 mb-3 text-black">포인트 사용</h2>
                  <div class="p-3 p-lg-5 border">
                    <label for="c_code" class="text-black mb-3">사용가능 포인트:</label>
                    <div class="input-group w-75">
                      <input type="text" class="form-control" id="c_code" placeholder="Coupon Code" aria-label="Coupon Code" aria-describedby="button-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-primary btn-sm" type="button" id="button-addon2">사용</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-6">
              <div class="row mb-5">
                <div class="col-md-12">
                  <h2 class="h3 mb-3 text-black">Coupon Code</h2>
                  <div class="p-3 p-lg-5 border">
                    
                    <label for="c_code" class="text-black mb-3">Enter your coupon code if you have one</label>
                    <div class="input-group w-75">
                      <input type="text" class="form-control" id="c_code" placeholder="Coupon Code" aria-label="Coupon Code" aria-describedby="button-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-primary btn-sm" type="button" id="button-addon2">Apply</button>
                      </div>
                    </div>
  
                  </div>
                </div>
              </div>
              
              <div class="row mb-5">
                <div class="col-md-12">
                  <h2 class="h3 mb-3 text-black">Your Order</h2>
                  <div class="p-3 p-lg-5 border">
                    <table class="table site-block-order-table mb-5">
                      <thead>
                        <th>Product</th>
                        <th>Total</th>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Top Up T-Shirt <strong class="mx-2">x</strong> 1</td>
                          <td>$250.00</td>
                        </tr>
                        <tr>
                          <td>Polo Shirt <strong class="mx-2">x</strong>   1</td>
                          <td>$100.00</td>
                        </tr>
                        <tr>
                          <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                          <td class="text-black">$350.00</td>
                        </tr>
                        <tr>
                          <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                          <td class="text-black font-weight-bold"><strong>$350.00</strong></td>
                        </tr>
                      </tbody>
                    </table>
  
                    <div class="form-group">
                      <button class="btn btn-primary btn-lg py-3 btn-block" onclick="window.location='thankyou.html'">결제하기</button>
                    </div>
  
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      

