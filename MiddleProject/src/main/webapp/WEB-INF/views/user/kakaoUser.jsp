<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p> 카카오 회원이네요 </p>
<p> 약 5초 후 메인페이지로 이동 </p>


<script type="text/javascript">
    setTimeout(function() {
        window.location.href = 'main.do';
    }, 10000); // 5초 (5000ms)
</script>
