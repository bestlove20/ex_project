<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login_btn").on("click",function(){
			var mem_id = $('#mem_id').val();
			var mem_pw = $('#mem_pw').val();
			if(mem_id == ''){
				alert("아이디를 입력해주세요");
				$("#mem_id").focus();
				return false;
			} else if(mem_pw == '') {
				alert("비밀번호를 입력해주세요");
				$("#mem_pw").focus();
				return false;
			} else {
				var frm = document.login;
				frm.method = "post";
				frm.action = "login";
				frm.submit();
			}
		})
	})
</script>
</head>
<body>
<form name="login" id="login" method="post">
ID : <input type="text" id="mem_id" name="mem_id"> <br>
PASSWORD : <input type="password" id="mem_pw" name="mem_pw"><br>
</form>
<input type="button" id="login_btn" name="login_btn"  value="로그인">
	
</body>
</html>