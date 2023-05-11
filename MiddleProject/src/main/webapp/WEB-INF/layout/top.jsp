<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.top-button {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 50px;
  height: 50px;
  background-color: #333;
  border-radius: 50%;
  text-align: center;
  line-height: 50px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  z-index: 9999;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s ease, visibility 0.3s ease;
}

.top-button:hover {
  background-color: #555;
}

.top-button.show {
  opacity: 1;
  visibility: visible;
}

.top-button .icon {
  font-size: 24px;
  color: #fff;
}
</style>

<a href="#" class="top-button">
  <span class="icon">&#9650;</span>
</a>

<script>
window.addEventListener('scroll', function() {
  var topButton = document.querySelector('.top-button');
  if (window.scrollY > 200) {
    topButton.classList.add('show');
  } else {
    topButton.classList.remove('show');
  }
});
</script>