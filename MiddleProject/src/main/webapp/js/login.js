//폼 빈칸x
function validateForm() {
	const user_id = document.getElementById("exampleInputEmail1");
	const user_pw = document.getElementById("exampleInputPassword1");

	if (user_id.value === "" || user_pw.value === "") {
		if (user_id.value === "") {
			user_id.classList.add("form-input-error");
		}
		if (user_pw.value === "") {
			user_pw.classList.add("form-input-error");
		}
		return false;
	}
}