<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript" src="/resources/js/handlebars.js"></script>
<script type="text/javascript"
	src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>

<!-- Main content -->
<section class="content-header">
	<h1>수정</h1>
	<ol class="breadcrumb">
		<li><a href="#"> Home</a></li>
		<li><a href="/ticket/list"> 서비스요청</a></li>
		<li class="active"><c:out value="${boardVO.bno}" /></li>
	</ol>
</section>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<input type="hidden" name='bno' class="form-control"
								value="${boardVO.bno}" readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='title' class="form-control" value="${boardVO.title}"
								required />
						</div>
						<div class="form-group">
							<input type="hidden" name="writer" class="form-control"
								value="${boardVO.writer}" readonly />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">분류</label> <select
								class="form-control" name="category">
								<c:choose>
									<c:when test="${boardVO.category eq '[계정생성/PW초기화]'}">
										<option selected>[계정생성/PW초기화]</option>
									</c:when>
									<c:otherwise>
										<option>[계정생성/PW초기화]</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${boardVO.category eq '[오류 문의]'}">
										<option selected>[오류 문의]</option>
									</c:when>
									<c:otherwise>
										<option>[오류 문의]</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${boardVO.category eq '[ITO시스템수용]'}">
										<option selected>[ITO시스템수용]</option>
									</c:when>
									<c:otherwise>
										<option>[ITO시스템수용]</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${boardVO.category eq '[교육 요청]'}">
										<option selected>[교육 요청]</option>
									</c:when>
									<c:otherwise>
										<option>[교육 요청]</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
						<c:if test="${login.uid eq 'cpadmin'}">
							<div class="form-group">
								<label for="exampleInputEmail1">상태</label> <select
									class="form-control" name="status">
									<c:choose>
										<c:when test="${boardVO.status eq 'Open'}">
											<option selected>Open</option>
										</c:when>
										<c:otherwise>
											<option>Open</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${boardVO.status eq 'In Progress'}">
											<option selected>In Progress</option>
										</c:when>
										<c:otherwise>
											<option>In Progress</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${boardVO.status eq 'Resolved'}">
											<option selected>Resolved</option>
										</c:when>
										<c:otherwise>
											<option>Resolved</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${boardVO.status eq 'Closed'}">
											<option selected>Closed</option>
										</c:when>
										<c:otherwise>
											<option>Closed</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</c:if>
						<div class="form-group">
							<label for="exampleInputEmail1">상태</label> <input type="text"
								class="form-control" value="${boardVO.status}" readonly />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">중요도</label> <select
								class="form-control" name="priority">
								<c:choose>
									<c:when test="${boardVO.priority eq 'Normal'}">
										<option selected>Normal</option>
									</c:when>
									<c:otherwise>
										<option>Normal</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${boardVO.priority eq 'High'}">
										<option selected>High</option>
									</c:when>
									<c:otherwise>
										<option>High</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${boardVO.priority eq 'Urgent'}">
										<option selected>Urgent</option>
									</c:when>
									<c:otherwise>
										<option>Urgent</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
						<div class="form-group">
							<label>완료 예정일 (완료일은 오늘 이후로 지정 가능합니다.)</label>
							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right"
									id="datepicker" name="duedate" value="${boardVO.duedate}"
									required>
							</div>
							<!-- /.input group -->
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" name="content" id="content"
								requird />${boardVO.content}</textarea>
						</div>
						<script>
					    ClassicEditor
					        .create( document.querySelector( '#content' ), {
					            // 제거 하고싶은 플러그인 (배열)
					             removePlugins: [ 'ImageUpload' ]
					        } )
					        .catch( error => {
					            console.error( error );
					        } );
					    </script>


						<div class="form-group">
							<label for="exampleInputEmail1">파일을 아래에 드래그&드롭 해주세요. ( 최대 10MB )</label>
							<div class="fileDrop"></div>
						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">


						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>
						<div class="row">
							<div class="col-xs-6">
								<button type="submit" class="btn btn-custom1 btn-block">저장</button>
							</div>
							<div class="col-xs-6">
								<button type="button" class="btn btn-custom2 btn-block"
									onclick="history.back(-1);">취소</button>
							</div>
						</div>
					</div>
				</form>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>

<script>
$(document).ready(function(){
		
	var formObj = $("form[role='form']");
	
	formObj.submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		console.log(str);
		
		that.get(0).submit();
	});
});




var template = Handlebars.compile($("#template").html());


$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	//console.log(file);
	
	var formData = new FormData();
	
	formData.append("file", file);	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$(".uploadedList").on("click", ".delbtn", function(event){
	
	event.preventDefault();
	
	var that = $(this);
	 
	$.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
   });
});


var bno = ${boardVO.bno};
var template = Handlebars.compile($("#template").html());

$.getJSON("/ticket/getAttach/"+bno,function(list){
	$(list).each(function(){
		
		var fileInfo = getFileInfo(this);
		
		var html = template(fileInfo);
		
		 $(".uploadedList").append(html);
		
	});
});

$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
	
	var fileLink = $(this).attr("href");
	
	if(checkImageType(fileLink)){
		
		event.preventDefault();
				
		var imgTag = $("#popup_img");
		imgTag.attr("src", fileLink);
		
		console.log(imgTag.attr("src"));
				
		$(".popup").show('slow');
		imgTag.addClass("show");		
	}	
});

$("#popup_img").on("click", function(){
	
	$(".popup").hide('slow');
	
});	

$("#datepicker").datepicker({
	startDate: new Date(),
	autoclose: true
});
</script>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<%@include file="../include/footer.jsp"%>
