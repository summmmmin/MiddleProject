//사이드바 (스크롤형)

  window.addEventListener('scroll', function() {
    var sidebar = document.querySelector('.sidebar');
    var rect = sidebar.getBoundingClientRect();
    var windowHeight = window.innerHeight;

    if (rect.top <= 0) {
      sidebar.style.position = 'fixed';
      sidebar.style.top = '20px';
    } else if (rect.top > windowHeight) {
      sidebar.style.position = 'fixed';
      sidebar.style.top = 'calc(100% - 200px)';
    } else {
      sidebar.style.position = 'relative';
      sidebar.style.top = 'auto';
    }
  });