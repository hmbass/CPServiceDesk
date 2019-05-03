<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Service Desk</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="/resources/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <link href="/resources/dist/css/sd_ad.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/skin-black-light.css" rel="stylesheet" type="text/css" />
          <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/js/ckeditor.js"></script>
    <script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {

							str = "/ticket/list"
									+ "?searchType=t"
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());

							console.log(str);

							self.location = str;

						});
			});
	</script>
	<script>
	function setCookie(cname, cvalue, exdays) {
	    var d = new Date();
	    d.setTime(d.getTime() + (exdays*24*60*60*1000));
	    var expires = "expires="+ d.toUTCString();
	    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
	function getCookie(cname) {
	    var name = cname + "=";
	    var ca = document.cookie.split(';');
	    for(var i = 0; i <ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0)==' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length,c.length);
	        }
	    }
	    return "";
	}
    $(window).load(function(){
        $('#sidebar-toggle').on('click', function () {
            if ($('#body').hasClass('skin-black-light sidebar-mini sidebar-collapse sidebar-open')){                    
            $('#body').removeClass('skin-black-light sidebar-mini sidebar-collapse sidebar-open') &&
            $('#body').addClass('skin-black-light sidebar-mini')
            $("#helpBtn").show();
            setCookie('left-sidebar_hide', 'show', 100);
          }else{
             $('#body').addClass('skin-black-light sidebar-mini sidebar-collapse sidebar-open')
             $("#helpBtn").hide();
             setCookie('left-sidebar_hide', 'hide', 100);
          }
        });
		 if (getCookie('left-sidebar_hide') == 'hide') {
            $('#sidebar-toggle').click();}
    });
	</script>
  </head>
  <body class="skin-black-light sidebar-mini" id="body">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="/common/home" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>S</b>D</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Service</b> Desk</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" id="sidebar-toggle" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="/common/myPage" class="dropdown-toggle">
                	<c:if test="${login.ugrade eq '2' }">
					<img src="/resources/dist/img/fox_128px.png" class="user-image" alt="User Image"/>
					</c:if>
					<c:if test="${login.ugrade ne '2' }">
					<img src="/resources/dist/img/elephant_128px.png" class="user-image" alt="User Image"/>
					</c:if>
                  <span class="hidden-xs">
                  <c:out value="${login.uname}"/>님, 환영합니다.
                  </span>
                </a>
              </li>
              
              <li>
              <a href="/user/logout" style="padding-top:17px; margin-right:10px;">  <i class="fa fa-sign-out"></i> </a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <c:if test="${login.uname eq '관리자' }">
					<img src="/resources/dist/img/fox_128px.png" class="user-image" alt="User Image"/>
				</c:if>
				<c:if test="${login.uname ne '관리자' }">
					<img src="/resources/dist/img/elephant_128px.png" class="user-image" alt="User Image"/>
				</c:if>
            </div>
            <div class="pull-left info">
              <p><c:out value="${login.uname}"/></p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
          <form id="searhform"class="sidebar-form" onsubmit="return false;">
            <div class="input-group">
              <input type="text" name="keyword" id="keywordInput" class="form-control" placeholder="Search..." value='${cri.keyword }'/>
              <span class="input-group-btn">
                <button type='button' class="btn btn-flat" name=search id='searchBtn'><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form> 
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li>
              <a href="/ticket/list">
                <i class="fa fa-trello" aria-hidden="true"></i> <span>서비스 요청</span> 
              </a>
            </li>
           	<li class="treeview">
              <a href="#">
                <i class="fa fa-book"></i>
                <span>사용자 매뉴얼</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/doc/doc1"><i class="fa fa-file-text-o"></i>Eclipse Plugin</a></li>
                <li><a href="/doc/doc2"><i class="fa fa-file-text-o"></i>CodePrism Client</a></li>
               <!--  <li><a href="#"><i class="fa fa-file-text-o"></i> Doc3</a></li>
                <li><a href="#"><i class="fa fa-file-text-o"></i> Doc4</a></li> -->
              </ul>
            </li>
            <li>
              <a href="/downloads/downlist">
                <i class="fa fa-download" aria-hidden="true"></i> <span>다운로드</span> 
              </a>
            </li>
            
          </ul>
          
          <ul class="list-unstyled CTAs">
                <button type="button" class="btn btn-custom4 btn-block" id="helpBtn" data-toggle="modal" data-target="#myModal">
					<i class="fa fa-info-circle" aria-hidden="true"></i> HELP
				</button>
				
           </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        