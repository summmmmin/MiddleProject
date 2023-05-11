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

  // 각 삭제 버튼에 클릭 이벤트
  deleteButtons.forEach(function(button) {
    button.addEventListener("click", function(event) {
      event.preventDefault(); // 기본 동작을 중지

      // 삭제할 wishId
      const wishId = this.getAttribute("data-wishId");

      // Ajax 요청
      const xhr = new XMLHttpRequest();
      xhr.open("POST", "deleteWishList.do", true);
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      
      // Ajax 응답을 처리
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          console.log("WishList 삭제 완료");
          location.reload(); // 페이지 새로고침
        }
      };
      // Ajax 요청을 전송
      xhr.send("wishId=" + wishId);
    });
  });
});