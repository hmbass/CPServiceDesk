<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserRegister</title>
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
			<p class="login-box-msg">Register</p>

			<form id="userRegisterForm" role="form" method="post">
				<div class="form-group has-feedback">
					<input type="text" id="uid" name="uid" class="form-control"
						placeholder="USER ID" minlength="6" required/> <span
						class="glyphicon glyphicon-user form-control-feedback" ></span>	
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="uname" class="form-control"
						placeholder="USER NAME" required/> <span
						class="glyphicon glyphicon-pencil form-control-feedback" ></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="team" class="form-control"
						placeholder="TEAM" required/> <span
						class="glyphicon glyphicon-leaf form-control-feedback" ></span>
				</div>
				<div class="form-group has-feedback">
		        	<input type="email" name="uemail" class="form-control" placeholder="Email" required/>
		        	<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		      	</div>
				<div class="form-group has-feedback">
					<input type="password" name="upw" id="upw" class="form-control"
						placeholder="Password" minlength="8" required/> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="upw2" id="upw2" class="form-control"
						placeholder="Retpye Password" minlength="8" required/> <span
						class="glyphicon glyphicon-ok form-control-feedback"></span> 
				</div>
				<div class="alert alert-info" id="alert-custom1">비밀번호가 일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				<p class="result">
					<span class="msg">PW 입력후 ID Check를 눌러주세요</span>
				</p>
				<div class="row">
					<div class="col-xs-4">
					<button type="button" class="btn btn-custom2 btn-block" id="back" onclick="location.href='login'"><b>뒤로가기</b></button>
					</div>
					<div class="col-xs-4">
					<button type="button" id="idCheck" class="btn btn-primary btn-block"><b>ID 확인</b> </button>
					</div>
					<!--  /.col -->
					<div class="col-xs-4">
						<button type="submit" id="submit" class="btn btn-custom1 btn-block" disabled="disabled"><b>가입</b></button>
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
	<script>
    $(function(){
        $("#alert-custom1").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#upw").val();
            var pwd2=$("#upw2").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-custom1").show();
                    $("#alert-danger").hide();
                }else{
                    $("#alert-custom1").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disalbed");
                }    
            }
        });
    });
	</script>
	<script> 
	$("#idCheck").click(function(){
	 
	 var query = {uid : $("#uid").val()};
	 var uid = $("#uid").val();
	/*  alert(query.uid);
	 return; */
	 $.ajax({
	  url : "/user/idCheck",
	  type : "post",
	  data : query,
	  success : function(data) {
	   if(data == 1) {
	    $(".result .msg").text("이미 가입된 사번입니다.");
	    $(".result .msg").attr("style", "color:#DE5F5B"); 
	    $("#submit").attr("disabled", "disabled");
	   } 
	   else{
	    $(".result .msg").text("신규 가입이 가능한 사번입니다.");
	    $(".result .msg").attr("style", "color:#505D79");
	    $("#submit").removeAttr("disabled");
	    }
	  }
	 });  // ajax 끝
	});
	
	$("#uid").keyup(function(){
		 $(".result .msg").text("ID CHECK를 눌러, 중복 확인해주십시오.");
		 $(".result .msg").attr("style", "color:#3333333");
		 
		 $("#submit").attr("disabled", "disabled");
		 
		});

	</script>

</body>
</html>