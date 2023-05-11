// 관심상품 목록에서 제거
window.addEventListener('DOMContentLoaded', function() {
  var deleteButtons = document.getElementsByClassName('delete-btn');
  
  Array.from(deleteButtons).forEach(function(button) {
    button.addEventListener('click', function(e) {
      e.preventDefault();
      var wishId = this.getAttribute('data-wishId');
      var deleteButton = this; // 버튼저장
      
      var xhr = new XMLHttpRequest();
      xhr.open('POST', 'deletewishList.do');
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
          if (xhr.status === 200) {
            console.log('관심상품 삭제 성공');
            // 삭제한 행을 화면에서 제거
            var row = deleteButton.closest('tr');
            row.parentNode.removeChild(row);
          } else {
            console.log('관심상품 삭제 실패');
          }
        }
      };
      xhr.send('wishId=' + encodeURIComponent(wishId));
    });
  });
});



//관심상품의 상품명을 눌렀을 때 해당 상품페이지로 이동
// 페이지 로드 후 실행
window.addEventListener('DOMContentLoaded', function() {
  var productLinks = document.getElementsByClassName('product-link');
  
  Array.from(productLinks).forEach(function(link) {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      var page = this.getAttribute('data-page');
      var pid = this.getAttribute('data-pid');
      var url = 'getProd.do?page=' + page + '&pid=' + pid;
      window.location.href = url;
    });
  });
});