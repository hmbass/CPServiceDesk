<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('.ScrollButton').fadeIn();
			} else {
				$('.ScrollButton').fadeOut();
			}
		});

		$("#TopButton").click(function() {
			$('html').animate({
				scrollTop : 0
			}, 600);
		});

	});
</script>
<!-- Main content -->
<section class="content-header">
	<h1>사용자매뉴얼</h1>
	<ol class="breadcrumb">
		<li><a href="#"> Home</a></li>
		<li><a href="/ticket/list"> Documents</a></li>
		<li class="active">사용자 가이드 (CodePrism Client)</li>
	</ol>
</section>
<section class="content" id="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- Box Comment -->
			<div class="box box-widget">
				<div class="box-header with-border">
					<div class="user-block">
						<img class="img-circle"
							src="/resources/dist/img/dolphin_128px.png" alt="User Image"
							style="width: 40px; height: 40px; align: left;"> <span
							class="username" style="font-size: 16px;"> 사용자 가이드
							(CodePrism Client)</span> <span class="description"> - 개정일
							19.04.11</span>
					</div>
					<!-- /.user-block -->
					<div class="box-tools">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool"
							data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
					<!-- /.box-tools -->
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<a id="TopButton" class="ScrollButton"><i
						class="fa fa-angle-up" aria-hidden="true"></i></a>

					<!-- 내용 시작 -->
					
					<p>
						소스코드점검 시스템(CodePrism) 사용 시, 아래 내용을 참고하여 사용 부탁드립니다.<br> 
						<strong>※ 사용자 계정과 시스템/프로젝트 가 수용되어 있어야 사용이 가능합니다.</strong>
					</p>
					<p>
						<strong>1. 소스코드점검 시스템 접속 정보</strong>
					</p>

					<div class="well">
							기본 계정 정보 ID : 사번 , PW : new1234! (소문자)
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc2/001.png" alt="Photo">
					<div class="row">
					<div class="col-sm-12">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>No</th>
								<th>항목명</th>
								<th>설명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td data-column="No">1</td>
								<td data-column="항목명">사내망 (KT ITO/SM/ETC)</td>
								<td data-column="설명">https://codeprism.ktds.co.kr:50102</td>
							</tr>
							<tr>
								<td data-column="No">2</td>
								<td data-column="항목명">외부망 (그룹사 SI)</td>
								<td data-column="설명">https://codeqa.ktds.co.kr:60102 (사내) /
									https://211.253.17.10:60102 (사외)</td>
							</tr>
							<!-- <tr>
								<td data-column="No">3</td>
								<td data-column="항목명">사내망(KT/KTDS SI)</td>
								<td data-column="설명">https://codeeyes.kt.co.kr:50102/</td>
							</tr> -->
						</tbody>
					</table></div></div>
					<p>
						<strong>2. 시스템 점검(일배치) 결과 확인 방법</strong>
					</p>
					<div class="well">
						※ 시스템이 소스코드검증시스템에 수용되어, SVN/FTP 등 소스 저장소에 접근이 가능해야합니다.
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc2/002.png" alt="Photo">
					<div class="well">
						CodePrism 클라이언트를 눌러서 실행<br> ※ ktds.co.kr 도메인이 호환성보기 추가
						되어있어야하며, 처음 실행시 설치과정부터 진행
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc2/003.png" alt="Photo">
					<div class="well">
						업무탐색기에서, 우클릭 &gt; 코드 품질/보안 점검 &gt; 룰 위반 보기를 클릭하여 점검결과 확인가능
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc2/004.png" alt="Photo">
					<div class="well">
						점검결과에서 더블 클릭시, 룰설명과 소스 내 위반 라인을 뷰어를 통해 확인 가능 ( 편집기능 X )
					</div>
					<div class="row">
					<div class="col-sm-12">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>등급</th>
								<th>조치필수여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td data-column="등급">Blocker</td>
								<td data-column="조치필수여부">필수</td>
							</tr>
							<tr>
								<td data-column="등급">Critical</td>
								<td data-column="조치필수여부">필수</td>
							</tr>
							<tr>
								<td data-column="등급">Urgent</td>
								<td data-column="조치필수여부">필수</td>
							</tr>
							<tr>
								<td data-column="등급">Important</td>
								<td data-column="조치필수여부">필수아님</td>
							</tr>
							<tr>
								<td data-column="등급">warning</td>
								<td data-column="조치필수여부">필수아님</td>
							</tr>
						</tbody>
					</table></div></div>
					<p>
						<strong>3. 점검 결과 예외처리 방법</strong>
					</p>
					<div class="well">
						일배치 점검 결과화면에서 검출 항목 &gt; 우클릭 &gt; 위반상태 설정
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc2/005.png" alt="Photo">
					<div class="well">
								※ 솔루션 부분/Legacy 소스 등 예외처리가 필요한 부분에 대해 예외처리 권한을 받은 상태에서 예외처리가
								가능합니다.<br> <span style="color: red">※ CodeEyes 시스템의
									경우에는 프로젝트 권한 부여 후, 예외처리 신청을 KT BA가 처리 가능합니다.</span>
					</div>
					<!-- 내용 종료 -->
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>
