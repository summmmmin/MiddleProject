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
                    <th>구매금액</th>
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
                      
                        <label for="sample6_postcode" class="text-black">주소 </label> <br>                 
                      
                      <div class="row">
                        <div class="col-md-8">
                          <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">                       
                        </div>
                        <div class="col-md-4">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</div>                      
                      </div>
                      </div>
                    </div>
                    <div class="form-group">
                	  <input type="text" class="form-control" id="sample6_address" placeholder="주소">
              		</div>
              		<div class="form-group">
                	  <input type="text" id="sample6_detailAddress" placeholder="상세주소">
					  <input type="text" id="sample6_extraAddress" placeholder="참고항목">
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
      
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
