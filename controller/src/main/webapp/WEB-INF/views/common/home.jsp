<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content-header">
	<h1>Home</h1>
	<ol class="breadcrumb">
		<li class="active"><a href="#"> Home</a></li>
	</ol>
</section>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
			 	<div class="box-body">
			 		<div class="jumbotron">
				 		<div class="container">
						  <h1>Need for Code Inspection</h1> 
						  <p>진행 중인 프로젝트의 성공은 초기에 장애를 예방하는 것에 있습니다.</p>
						  <p><a class="btn btn-custom1 btn-lg" href="/doc/doc1" role="button">사용해보기</a></p>
						  
						</div>
					</div>
			 	</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
          <!-- Custom Tabs (Pulled to the right) -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs pull-right">
              <li class=""><a href="#tab_1-1" data-toggle="tab" aria-expanded="true">Rule Grade</a></li> 
              <!-- <li class=""><a href="#tab_2-2" data-toggle="tab" aria-expanded="false">Tab 2</a></li> -->
              <li class="active"><a href="#tab_3-2" data-toggle="tab" aria-expanded="false">공지사항</a></li> 
              
              <li class="pull-left header"><i class="fa fa-bullhorn"></i> Notice</li>
            </ul>
            <div class="tab-content" style="min-height:325px">
              <div class="tab-pane" id="tab_1-1">
                <div class="box-body text-center">
              <p>5가지 등급 중 <code>Urgent</code>이상은 필수 조치대상입니다.</p>

	              <div class="progress vertical">
	                <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="height: 0%">
	                  <span class="sr-only">40%</span>
	                </div>
	              </div>
	              <div class="progress vertical">
	                <div class="progress-bar progress-bar-blue" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="height: 100%">
	                  <span class="sr-only">40%</span>
	                </div>
	              </div>
	              <div class="progress vertical">
	                <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="height: 100%">
	                  <span class="sr-only">20%</span>
	                </div>
	              </div>
	              <div class="progress vertical">
	                <div class="progress-bar progress-bar-yellow" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="height: 100%">
	                  <span class="sr-only">60%</span>
	                </div>
	              </div>
	              <div class="progress vertical">
	                <div class="progress-bar progress-bar-red" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="height: 100%">
	                  <span class="sr-only">80%</span>
	                </div>
	              </div>
	              <p>Warning, Important, Urgent, Critical, Blocker</p>
            </div>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2-2">
                탭2
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane active" id="tab_3-2">
                <table class="table table-bordered" id="boardSection">
							<tr>
								<th style="width: 70px">NO</th>
								<th style="width: auto">TITLE</th>
								<th style="width: 150px">DATE</th>
							</tr>
							<c:forEach items="${list}" var="boardVO">
									<tr>
										<td>${boardVO.bno}</td>
										<td><a
											href='/ticket/readPage?bno=${boardVO.bno}'>
												${boardVO.title} 
										</a></td>
										
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${boardVO.regdate}" /></td>
									</tr>
							
							</c:forEach>
						</table>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
        </div>
        <!-- /.col -->
         <!-- <div class="col-md-6">
        
          <div class="box box-solid">
            <div class="box-header with-border">
            <i class="fa fa-th"></i>
              <h3 class="box-title">Carousel</h3>
            </div>
            /.box-header
            
            <div class="box-body" >
              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item">
                    <img src="http://placehold.it/900x500/39CCCC/ffffff&amp;text=I+Love+Bootstrap" alt="First slide">

                    <div class="carousel-caption">
                      First Slide
                    </div>
                  </div>
                  <div class="item">
                    <img src="http://placehold.it/900x500/3c8dbc/ffffff&amp;text=I+Love+Bootstrap" alt="Second slide">

                    <div class="carousel-caption">
                      Second Slide
                    </div>
                  </div>
                  <div class="item active">
                    <img src="http://placehold.it/900x500/f39c12/ffffff&amp;text=I+Love+Bootstrap" alt="Third slide">

                    <div class="carousel-caption">
                      Third Slide
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                  <span class="fa fa-angle-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                  <span class="fa fa-angle-right"></span>
                </a>
              </div>
            </div>
            /.box-body
          </div>
          /.box
        </div> --> 
        <!-- /.col -->
      </div>
</section>

<%@include file="../include/footer.jsp"%>
