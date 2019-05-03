<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("요청이 완료되었습니다.");
	}else if(result == 'IDSUCCESS'){
		alert("임시비밀번호 발급이 완료되었습니다.");
	}
</script>
<meta charset="UTF-8">
<title>Login Page</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link href="/resources/css/font-awesome.min.css"rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.css" rel="stylesheet"
	type="text/css" />
<!-- iCheck -->
<link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet"
	type="text/css" />
</head>
<body class="login-page">
	<div class="login-box">
		<div class="login-logo">
			<img src="/resources/dist/img/logo1.png" style="width:auto;height:70px">
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">LOGIN</p>

			<form action="/user/loginPost" method="post">
				<div class="form-group has-feedback">
					<input type="text" name="uid" class="form-control"
						placeholder="USER ID" required /> <span
						class="glyphicon glyphicon-user form-control-feedback" ></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="upw" class="form-control"
						placeholder="Password" required /> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="alert alert-info" id="alert-custom1">계정 초기 패스워드는 new1234! 입니다.</div>
				
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" name="useCookie">
								Remember Me
							</label>
						</div>
					</div>
					<!--  /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-custom1 btn-block"><b>로그인</b></button>
					</div>
					<!--  /.col -->
				</div>
			</form>
			<button type="button" class="btn btn-custom2 btn-block" onclick="location.href='/user/userRegister'"><b>회원 가입</b> </button>
			<button type="button" class="btn bg-navy btn-block" onclick="location.href='/user/findpw'"><b>PW 찾기</b> </button>
		</div>
	</div>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
	<script>
	 $(function () {
		 $('input').iCheck({
	          checkboxClass: 'icheckbox_square-blue',
	          radioClass: 'iradio_square-blue',
	          increaseArea: '20%' // optional
	        });
		 
		var fail = '${param.error}';
		
		if(fail){
			alert("ID나 PW를 확인해주세요.")
			return false;
		} 
        
      });
    </script>
</body>
</html>