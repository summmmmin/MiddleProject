// 삭제확인 창을 표시 (modal)
function showConfirmation(wishId) {
	var confirmed = confirm("정말로 삭제하시겠습니까?");
	if (confirmed) {
		deleteWishlistItem(wishId);
	}
}


document.addEventListener("DOMContentLoaded", function() {
  // 삭제 버튼을 선택
  const deleteButtons = document.querySelectorAll(".delete-btn");

  // 각 삭제 버튼에 클릭 이벤트를 바인딩합니다.
  deleteButtons.forEach(function(button) {
    button.addEventListener("click", function(event) {
      event.preventDefault(); // 기본 동작을 중지시킵니다.

      // 삭제할 wishId를 가져옵니다.
      const wishId = this.getAttribute("data-wishId");

      // Ajax 요청을 생성합니다.
      const xhr = new XMLHttpRequest();
      xhr.open("POST", "deleteWishList.do", true);
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      
      // Ajax 응답을 처리하는 함수를 정의합니다.
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          // Ajax 요청이 성공적으로 완료되었을 때의 처리를 여기에 작성합니다.
          // 예를 들어, 성공적으로 삭제되었다는 알림을 표시하거나, 목록을 새로고침할 수 있습니다.
          console.log("WishList 삭제 완료");
          location.reload(); // 페이지 새로고침
        }
      };
      
      // Ajax 요청을 전송합니다.
      xhr.send("wishId=" + wishId);
    });
  });
});