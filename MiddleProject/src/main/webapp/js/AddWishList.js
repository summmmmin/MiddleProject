function openWishModal(button) {
    var pid = $(button).data('pid'); // 버튼의 data-pid 속성 값을 가져옴

    $.ajax({
        url: 'addwishList.do',
        type: 'POST',
        data: { pid: pid }, // pid 값을 전달
        success: function(response) {
            console.log('관심상품 등록 성공');
            $('#wishModal').modal('show'); // 모달 창 열기
        },
        error: function() {
            console.log('관심상품 등록 실패');
        }
    });
}
