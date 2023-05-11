//사이드바 (스크롤형)

  var sidebar = document.querySelector('.sidebar');
  var sidebarTop = sidebar.getBoundingClientRect().top;

  window.addEventListener('scroll', function() {
    var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    var sidebarOffset = sidebarTop + scrollTop;
    sidebar.style.transform = 'translateY(' + sidebarOffset + 'px)';
  });