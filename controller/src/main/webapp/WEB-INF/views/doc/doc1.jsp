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
        $('html').animate({scrollTop : 0}, 600);
    });

});

</script>
<!-- Main content -->
<section class="content-header">
	<h1>사용자매뉴얼</h1>
	<ol class="breadcrumb">
		<li><a href="#"> Home</a></li>
		<li><a href="/ticket/list"> Documents</a></li>
		<li class="active">사용자 가이드 (Eclipse Plugin)</li>
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
							(Eclipse Plugin)</span> <span class="description"> - 개정일 19.04.11</span>
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
				<a id="TopButton" class="ScrollButton"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
				

					<!-- 내용 시작 -->
					<p>
						소스코드점검 시스템(CodePrism) 사용 시, 아래 내용을 참고하여 사용 부탁드립니다.<br> <strong>※
							사용자 계정과 시스템/프로젝트 가 수용되어 있어야 사용이 가능합니다.</strong>
					</p>
					<p>
						<strong>1. 소스코드점검 시스템 접속 정보</strong>
					</p>
					<div class="well">
					기본 계정 정보 ID : 사번 , PW : new1234! (소문자)
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/001.png" alt="Photo">
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
<!-- 							<tr>
								<td data-column="No">3</td>
								<td data-column="항목명">사내망(KT/KTDS SI)</td>
								<td data-column="설명">https://codeeyes.kt.co.kr:50102/</td>
							</tr> -->
						</tbody>
					</table>
					</div>
					</div>
					<p>
						<strong>2. Eclipse Plugin 설치 방법</strong>
					</p>
					<div class="well">
						Eclipse 상단 메뉴 &gt; Help &gt; Install New Software... 클릭
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/002.png" alt="Photo">
					<div class="well">
						Add... 클릭하여, Location 에 아래와 같이 목적에 맞게 입력후, Core / Language
						Pack 모두 체크 후 설치 진행
					</div>
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
								<td data-column=" 설명">https://codeprism.ktds.co.kr:50102/codeprism/eclipse</td>
							</tr>
							<tr>
								<td data-column="No">2</td>
								<td data-column="항목명">외부망 (그룹사 SI)</td>
								<td data-column=" 설명">https://codeqa.ktds.co.kr:60102/codeprism/eclipse</td>
							</tr>
<!-- 							<tr>
								<td data-column="No">3</td>
								<td data-column="항목명">사내망 (KT/KTDS SI)</td>
								<td data-column=" 설명">https://codeeyes.kt.co.kr:50102/codeprism/eclipse</td>
							</tr> -->
						</tbody>
					</table>
					</div>
					</div>
					<div class="well">
						※ 외부망에서 설치 시, Windows hosts 파일에서, 211.253.17.10
						codeqa.ktds.co.kr 도메인 지정 필요 <br> ※ <span style="color: red">Contact
							all update sites during install to find required software 옵션은
							체크 해제 </span><br> ※ 설치 진행하며, Install anyway로 진행, 설치 후 Eclipse
						Restart
					</div>
					<p>
						<strong>3. Eclipse Plugin 설정 방법</strong>
					</p>
					<div class="well">
						Eclipse 상단 메뉴 &gt; Window &gt; Preferences &gt; CodePrism 선택
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/003.png" alt="Photo">
					<div class="well">
						1.룰서버 사용 체크<br> 2.서버 정보 입력 , SSL 사용 체크<br> 3.포트 입력<br>
						4.아이디 패스워드 입력<br> 5.연결 테스트 &amp; 업데이트 진행
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/004.png" alt="Photo">
					<div class="well">
							Eclipse 상단 메뉴 &gt; CodePrism 에서 로그인 정보 저장 후, 로그인 (*이후 마우스 우클릭시, 자동 로그인)
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/005.png" alt="Photo">
					<div class="well">
						1.프로젝트 우클릭 &gt; Properties &gt; CodePrism &gt; 서버에서 생성한 자가점검
						프로젝트를 사용합니다. <br> 2.식별명 선택<br> 3. 서버 분석단위 ( 룰셋 ) 선택, 후
						Apply and Close
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/006.png" alt="Photo">
					<div class="well">
							프로젝트 우클릭 &gt; CodePrism &gt; CodePrism 분석 (파일 단위로도 분석가능)
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/007.png" alt="Photo">
					<div class="well">
					CodePrism 분석결과 확인, 점검결과 업로드 버튼을 통해, 서버로 결과 전송
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
								<td data-column="조치필수여부">옵션</td>
							</tr>
							<tr>
								<td data-column="등급">warning</td>
								<td data-column="조치필수여부">옵션</td>
							</tr>
						</tbody>
					</table>
					</div></div>
					<p>
						<strong>4. 점검결과 예외처리</strong>
					</p>

					<div class="well">
					※ 오탐&amp;예외처리 시, QA팀 소스코드검증 시스템 담당자에게 확인이 필요합니다.
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/008.png" alt="Photo">
					<div class="well">
						검출 건 우클릭 &gt; 결함 상태 편집 &gt; 종류&amp;메시지 입력후 OK &gt; 결과 서버에 업로드 (필수)
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/009.png" alt="Photo">
					<div class="well">
						제외 필터보기로, 예외처리 한 내역 확인 가능
					</div>
					<p>
						<strong>5. 이클립스 플러그인 삭제</strong>
					</p>
					<div class="well">
							플러그인 업데이트 중 문제가 생기면, 아래와 같이 완전 삭제 후 재설치 부탁 드립니다. <br> Help
							&gt; installation Details 혹은 Help &gt; About Eclipse &gt;
							installation Details ( <span style="color: red"> 이클립스 버전에
							따라 메뉴가 다름</span> )
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/010.png" alt="Photo">
					<div class="well">
							CodePrism Core / Language Pack 등을 Uninstall 을 눌러 삭제 합니다. <br>
							하나 삭제 후 재부팅 하겠냐고 물의시면 No를 클릭하여, 일괄 삭제 후 이클립스를 종료 합니다.
					</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/011.png" alt="Photo">
					<div class="well">
							이클립스 디렉토리 &gt; artifact.xml 을 열어, Ctrl + F를 눌러, "gtone" 으로 검색하여,
							<br>

							<code>&lt;artifact classfier=""~ &lt;/artifact&gt;</code>
							문단을 모두 삭제합니다. <br> ( <span style="color: red">※파일 내에
								검색 안되게 모두 삭제</span> )
						</div>
					<img class="img-responsive pad" src="/resources/doc/doc1/012.png" alt="Photo">
					<div class="well">
						plugins 디렉토리에서 gtone 으로 검색하여, 나오는 디렉토리/jar 파일을 모두 삭제합니다.<br>

						( <span style="color: red">※플러그인 설치 충돌시 갯수가 스크린샷과 다르게 나올
							수 있습니다.</span> )
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
