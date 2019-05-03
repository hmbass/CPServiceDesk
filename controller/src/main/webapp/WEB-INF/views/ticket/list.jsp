<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("요청이 완료되었습니다.");
	}
</script>
<%@include file="../include/header.jsp"%>
<section class="content-header">
	<h1>서비스 요청 </h1>
	<ol class="breadcrumb">
		<li><a href="#"> Home</a></li>
		<li class="active">서비스 요청</li>
	</ol>
</section>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<div class="row">
						<div class="col-sm-9"></div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-custom1 btn-block"
								id='newBtn'>
								<i class="fa fa-pencil" aria-hidden="true"></i> <b>글 쓰기</b>
							</button>
						</div>
					</div>
				</div>
				
				<div class="box-body">
					<c:if test="${fn:length(list) < 1}">
						<div style="text-align:center;">작성된 글이 없습니다.</div>
					</c:if>

					
				<div class="panel panel-default">
					<ul class="list-group">
						<c:forEach items="${list}" var="boardVO">
							<c:if test="${boardVO.status eq 'Closed'}">
							<li class="list-group-item list-group-item-question list-group-no-note clearfix">
							</c:if>
							<c:if test="${boardVO.status ne 'Closed'}">	
								<li class="list-group-item list-group-item-question list-group-has-note clearfix">
							</c:if>
								<div class="list-title-wrapper clearfix">
									<div class="list-tag clearfix">
										<span class="list-group-item-text article-id">#${boardVO.bno}</span> 
										<c:if test="${boardVO.category eq '공지사항'}">
										<a href="/ticket/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}"
											class="list-group-item-text item-tag label label-danger"><i
											class="fa fa-comments"></i> ${boardVO.category}</a>
										</c:if>
										<c:if test="${boardVO.category ne '공지사항'}">
										<a href="/ticket/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}"
											class="list-group-item-text item-tag label label-info"><i
											class="fa fa-comments"></i> ${boardVO.category}</a>
										</c:if>
										<c:if test="${boardVO.category ne '공지사항'}">
											<c:if test="${boardVO.status eq 'Open'}">
											<span class="list-group-item-text item-tag label label-custom1">${boardVO.status} </span>
											</c:if> 
											<c:if test="${boardVO.status eq 'In Progress'}">
												<span class="list-group-item-text item-tag label label-warning">${boardVO.status} </span>
											</c:if> 
											<c:if test="${boardVO.status eq 'Resolved'}">
												<span class="list-group-item-text item-tag label label-custom2">${boardVO.status} </span>
											</c:if> 
											<c:if test="${boardVO.status eq 'Closed'}">
												<span class="list-group-item-text item-tag label label-custom3">${boardVO.status} </span>
											</c:if>
										</c:if>
									</div>

									<h5 class="list-group-item-heading list-group-item-evaluate">
										<a href="/ticket/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}"> ${boardVO.title}<strong>[${boardVO.replycnt}]</strong> </a>
										
									</h5>
								</div>

								

								<div class="list-group-item-author clearfix">
									<div class="avatar avatar-list clearfix ">
										<c:if test="${boardVO.writer eq 'cpadmin' }">
										<a class="avatar-photo">
										<img src="/resources/dist/img/fox_128px.png"></a>
										</c:if>
										<c:if test="${boardVO.writer ne 'cpadmin' }">
										<a class="avatar-photo">
										<img src="/resources/dist/img/elephant_128px.png"></a>
										</c:if>
										<div class="avatar-info">
											<a class="nickname" href=#">${boardVO.writer}</a>
											
											<div class="date-created">
												<span class="timeago"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></span>
											</div>
										</div>
									</div>
								</div>
							</li>

						</c:forEach>

					</ul>
					</div>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	$(document).ready(
			function() {

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>

<%@include file="../include/footer.jsp"%>