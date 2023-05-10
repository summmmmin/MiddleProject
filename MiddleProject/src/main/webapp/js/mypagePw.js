//마이페이지 진입 전 비밀번호 일치여부 확인

function checkPassword(event) {
	event.preventDefault(); // 기본 동작 취소

	var userPw = document.getElementById("user_pw").value;

	fetch('/mypagePw.do', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: 'user_inputpw=' + userPw // 수정된 부분
	})
		.then(function(response) {
			console.log(response);
			if (response.ok) {
				// 비밀번호가 일치하는 경우
				window.location.href = 'mypageView.do';
			} else if (response.status === 401) {
				// 비밀번호가 일치하지 않는 경우
				alert('비밀번호가 일치하지 않습니다.');
			} else {
				// 그 외의 오류가 발생한 경우
				alert('오류가 발생했습니다.');
			}
		})
		.catch(function(error) {
			console.log(error);
			alert('오류가 발생했습니다.');
		});
}
