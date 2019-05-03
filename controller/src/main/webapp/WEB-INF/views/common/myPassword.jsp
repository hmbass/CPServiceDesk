<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("정보 변경이 완료되었습니다.");
	}
</script>
<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content-header">
	<h1>User page</h1>
	<ol class="breadcrumb">
		<li><a href="#"> Home</a></li>
		<li class="active">My Page</li>
	</ol>
</section>
<section class="content">

	<div class="row">
		<div class="col-md-3">

			<!-- Profile Image -->
			<div class="box box-primary">
				<div class="box-body box-profile">
					<c:if test="${login.ugrade eq '2'}">
					<img class="profile-user-img img-responsive img-circle"
						src="/resources/dist/img/fox_128px.png" alt="User profile picture">
					</c:if>
					<c:if test="${login.ugrade ne '2'}">
					<img class="profile-user-img img-responsive img-circle"
						src="/resources/dist/img/elephant_128px.png" alt="User profile picture">
					</c:if>
					<h3 class="profile-username text-center">
						<c:out value="${login.uname}" />
					</h3>

					<ul class="list-group list-group-unbordered">
						<li class="list-group-item"><b>ID</b> <a class="pull-right"><c:out
									value="${login.uid}" /></a></li>
						<li class="list-group-item"><b>REGDATE</b> <a
							class="pull-right"><fmt:formatDate pattern="yy-MM-dd"
									value="${login.regdate}" /></a></li>
					</ul>

					<a href="/user/logout" class="btn btn-custom2 btn-block"><b>Log
							Out</b></a>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->

			<!-- About Me Box -->
			<a href="/common/myPage" class="btn btn-custom1 btn-block"><b>Change Info</b></a>
			<!-- /.box -->
		</div>
		<!-- /.col -->
		<div class="col-md-9">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#password" data-toggle="tab"
						aria-expanded="false">Password</a></li>
				</ul>
				<div class="tab-content">
										
					<div class="tab-pane active" id="password">
						<form id="userchpwForm" role="form" method="post"
							class="form-horizontal">
							<input type="hidden" id="uid" name="uid" class="form-control"
										value="${login.uid}" readonly />
							<div class="form-group has-feedback">
								<label for="inputPassword3" class="col-xs-2 control-label">NEW
									PW : </label>
								<div class="col-xs-5">
									<input type="password" id="upw" name="upw" class="form-control"
										placeholder="NEW PASSWORD" required /> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="inputPassword3" class="col-xs-2 control-label">RETYPE
									PW : </label>
								<div class="col-xs-5">
									<input type="password" id="upw2" name="upw2" class="form-control"
										placeholder="RE PASSWORD " required /> <span
										class="glyphicon glyphicon-ok form-control-feedback"></span>
								</div>
							</div>
							<div class="alert alert-custom1" id="alert-custom1"><b>비밀번호가 일치합니다.</b></div>
							<div class="alert alert-danger" id="alert-danger"><b>비밀번호가 일치하지 않습니다.</b></div>
							<button type="submit" id="submit"
								class="btn btn-block btn-custom1 btn-flat" disabled="disabled">
								<b>Change Password</b>
							</button>
						</form>
					</div>
					<!-- /.tab-pane -->
					
				</div>
				<!-- /.tab-content -->
			</div>
			<!-- /.nav-tabs-custom -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
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
                $("#submit").removeAttr("disabled");
            }else{
                $("#alert-custom1").hide();
                $("#alert-danger").show();
                $("#submit").attr("disabled", "disalbed");
            }    
        }
    });
});
</script>


<%@include file="../include/footer.jsp"%>