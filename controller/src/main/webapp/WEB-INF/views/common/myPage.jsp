<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
			<a href="/common/myPassword" class="btn btn-custom1 btn-block"><b>Change Password</b></a>
			<!-- /.box -->
		</div>
		<!-- /.col -->
		<div class="col-md-9">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#myticket" data-toggle="tab"
						aria-expanded="true">My Ticket</a></li>
					<li class=""><a href="#settings" data-toggle="tab"
						aria-expanded="false">Settings</a></li>
				</ul>
				<div class="tab-content">

					<div class="tab-pane active" id="myticket">
						<div class="alert alert-warning alert-dismissible">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">×</button>
							<h4>
								<i class="icon fa fa-warning"></i> 안내
							</h4>
							* 서비스 요청건은 최근 20건까지만 표시됩니다. 
						</div>
						<table class="table table-bordered" id="boardSection">
							<tr>
								<th style="width: 70px">NO</th>
								<th style="width: 170px">CATEGORY</th>
								<th style="width: auto">TITLE</th>
								<th style="width: 120px">STATUS</th>
								<th style="width: 120px">PROGRESS</th>
								<th style="width: 150px">DATE</th>
							</tr>
							<c:if test="${fn:length(list) < 1}">
							<tr>
								<td  colspan="6">
								<div style="text-align:center;">작성된 글이 없습니다.</div>
								</td>
							</tr>
							</c:if>
							<c:forEach items="${list}" var="boardVO">
									<tr>
										<td>${boardVO.bno}</td>
										<td>${boardVO.category}</td>
										<td><a
											href='/ticket/readPage?bno=${boardVO.bno}'>
												${boardVO.title} <strong>[${boardVO.replycnt}]</strong>
										</a></td>
										<td><c:if test="${boardVO.status eq 'Open'}">
												<span class="badge bg-custom1">${boardVO.status} </span>
											</c:if> <c:if test="${boardVO.status eq 'In Progress'}">
												<span class="badge bg-yellow">${boardVO.status} </span>
											</c:if> <c:if test="${boardVO.status eq 'Resolved'}">
												<span class="badge bg-custom2">${boardVO.status} </span>
											</c:if> <c:if test="${boardVO.status eq 'Closed'}">
												<span class="badge bg-custom3">${boardVO.status} </span>
											</c:if></td>
										<td>
											<div class="progress progress-xs">
												<c:if test="${boardVO.status eq 'Open'}">
													<div class="progress-bar progress-bar-primary"
														style="width: 25%"></div>
												</c:if>
												<c:if test="${boardVO.status eq 'In Progress'}">
													<div class="progress-bar progress-bar-yellow"
														style="width: 50%"></div>
												</c:if>
												<c:if test="${boardVO.status eq 'Resolved'}">
													<div class="progress-bar progress-bar-custom2"
														style="width: 75%"></div>
												</c:if>
												<c:if test="${boardVO.status eq 'Closed'}">
													<div class="progress-bar progress-bar-custom3"
														style="width: 100%"></div>
												</c:if>
											</div>
										</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${boardVO.regdate}" /></td>
									</tr>
							</c:forEach>
						</table>
					</div>
					
					<div class="tab-pane" id="settings">
					<div class="alert alert-warning alert-dismissible">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">×</button>
							<h4>
								<i class="icon fa fa-warning"></i> 안내
							</h4>
							* 정보변경 후 재로그인 시, 변경된 정보 확인이 가능합니다.
						</div>
						<form id="userchinfoForm" role="form" method="post"
							class="form-horizontal">
							<div class="form-group has-feedback">
								<label for="inputEmail3" class="col-xs-2 control-label">User
									ID : </label>
								<div class="col-xs-5">
									<input type="text" id="uid" name="uid" class="form-control"
										value="${login.uid}" readonly /> <span
										class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="inputPassword3" class="col-xs-2 control-label">User
									Name : </label>
								<div class="col-xs-5">
									<input type="text" name="uname" class="form-control"
										value="${login.uname}"/> <span
										class="glyphicon glyphicon-pencil form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
							<label for="inputPassword3" class="col-xs-2 control-label">
									Team : </label>
								<div class="col-xs-5">
								<input type="text" name="team" class="form-control"
									value="${login.team}"  /> <span
									class="glyphicon glyphicon-leaf form-control-feedback" ></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="inputPassword3" class="col-xs-2 control-label">User
									EMAIL : </label>
								<div class="col-xs-5">
									<input type="email" name="uemail" class="form-control"
										value="${login.uemail}" /> <span
										class="glyphicon glyphicon-envelope form-control-feedback"></span>
								</div>
							</div>
							<button type="submit" id="submit"
								class="btn btn-block btn-custom1 btn-flat">
								<b>Change Setting</b>
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



<%@include file="../include/footer.jsp"%>