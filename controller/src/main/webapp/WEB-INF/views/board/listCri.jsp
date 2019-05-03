<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script>
    var result = '${msg}';
    
    if(result == 'success'){
    	alert("처리가 완료되었습니다.");
    }
</script>
<%@include file="../include/header.jsp"%>


<!-- Main content -->
<section class="content">
	<div class="row">
	<!-- left column -->
	<div class="col-md-12">
		<!-- general form elements -->
		<table class="table table-boardered">
		<tr>
			<th style="width:10px">BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
			<th style="width:40px">VEIWCNT</th>
		</tr>
		
		<c:forEach items="${list}" var="boardVO">
		
		<tr>
			<td>${boardVO.bno}</td>
			<td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
			<td>${boardVO.writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></td>
			<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
		</tr>
		</c:forEach>
		</table>
		
		
		
	</div>
	<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->



<%@include file="../include/footer.jsp"%>