<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- el 기본 문법 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	var result = '${msg}';

	if (result == 'IDFAIL') {
		alert("존재하지 않는 ID입니다.");
	}
</script>
<title>FindPW</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="/resources/css/font-awesome.min.css"rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.css" rel="stylesheet" type="text/css" />

</head>
<body class="register-page">
	<div class="register-box">
		<div class="register-logo">
			<img src="/resources/dist/img/logo1.png" style="width:auto;height:70px">
		</div>
		<!-- /.register-logo -->
		<div class="register-box-body">
			<p class="login-box-msg">FIND PASSWORD</p>

			<form id="userRegisterForm" action="/user/mail" role="form" method="post">
				<div class="form-group has-feedback">
					<input type="text" id="uid" name="uid" class="form-control"
						placeholder="USER ID" minlength="6" required/> <span
						class="glyphicon glyphicon-user form-control-feedback" ></span>	
				</div>
				<div class="form-group has-feedback">
		        	<input type="email" name="uemail" class="form-control" placeholder="Email" required/>
		        	<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		      	</div>
				<div class="row">
					<div class="col-xs-4">
					<button type="button" class="btn btn-custom2 btn-block" id="back" onclick="location.href='login'"><b>Back</b></button>
					</div>
					<div class="col-xs-4"></div>
					<div class="col-xs-4">
						<button type="submit" id="submit" class="btn btn-custom1 btn-block"><b>PW 찾기</b></button>
					</div>
					<!--  /.col -->
				</div>
			</form>
		</div>
	</div>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>