// 삭제확인 창을 표시 (modal)
function showConfirmation(wishId) {
	var confirmed = confirm("정말로 삭제하시겠습니까?");
	if (confirmed) {
		deleteWishlistItem(wishId);
	}
}