var activateButton = document.getElementById("activateInput");
var inputField = document.getElementById("dlvy_state_input");
var applyButton = document.getElementById("applyInput");
var deliveryText = document.getElementById("delivery-text");

activateButton.addEventListener("click", function() {
  inputField.style.display = "block";
  applyButton.style.display = "inline-block";
  activateButton.style.display = "none";
  inputField.value = deliveryText.innerText;
});

applyButton.addEventListener("click", function() {
  var inputValue = inputField.value;
  console.log("입력값:", inputValue);
  deliveryText.innerText = inputValue;
  inputField.style.display = "none";
  applyButton.style.display = "none";
  activateButton.style.display = "inline-block";

  // ModifyDlvy.do로 데이터 전송
  fetch('modifyDlvy.do', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'dlvNum=' + inputValue // 변경된 운송장 번호 데이터 전송
  })
  .then(function(response) {
    return response.json();
  })
  .then(function(result) {
    if (result.retCode === 'Success') {
      // 성공적으로 업데이트된 경우의 처리
    } else if (result.retCode === 'Fail') {
      // 업데이트 실패의 처리
    } else {
      // 알 수 없는 반환값의 처리
    }
  })
  .catch(function(error) {
    // 요청 실패의 처리
  });
});

<script src="js/buyDetail.js"></script>