window.addEventListener('DOMContentLoaded', function() {
  var deleteButtons = document.getElementsByClassName('delete-btn');
  
  Array.from(deleteButtons).forEach(function(button) {
    button.addEventListener('click', function(e) {
      e.preventDefault();
      var wishId = this.getAttribute('data-wishId');
      
      var xhr = new XMLHttpRequest();
      xhr.open('POST', 'deletewishList.do');
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
          if (xhr.status === 200) {
            console.log('관심상품 삭제 성공');
            // 삭제한 행을 화면에서 제거
            var row = this.closest('tr');
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