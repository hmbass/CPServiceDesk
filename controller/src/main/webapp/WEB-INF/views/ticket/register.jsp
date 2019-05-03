<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript" src="/resources/js/handlebars.js"></script>
<script type="text/javascript" src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>


<!-- Main content -->
<section class="content-header">
          <h1>
			글 쓰기
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"> Home</a></li>
            <li><a href="/ticket/list"> 서비스 요청</a></li>
            <li class="active"> 글 쓰기</li>
          </ol>
</section>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">

				<form id='registerForm' role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='title' class="form-control" placeholder="Enter Title"
								required />
						</div>
						<div class="form-group">
							<!-- <label for="exampleInputEmail1">Writer</label> --> 
							<input type="hidden"
								name="writer" class="form-control" value='${login.uid }'
								readonly>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">분류</label> 
							<select class="form-control" name="category">
							  <option>[계정생성/PW초기화]</option>
							  <option>[오류 문의]</option>
							  <option>[ITO시스템수용]</option>
							  <option>[교육 요청]</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">중요도</label> 
							<select class="form-control" name="priority">
							  <option>Normal</option>
							  <option>High</option>
							  <option>Urgent</option>
							</select>
						</div>
						<div class="form-group">
			                <label>완료 예정일 (완료일은 오늘 이후로 지정 가능합니다.)</label>
			                <div class="input-group date">
			                  <div class="input-group-addon">
			                    <i class="fa fa-calendar"></i>
			                  </div>
			                  <input type="text" class="form-control pull-right" id="datepicker" name="duedate" required>
			                </div>
			                <!-- /.input group -->
		                </div>
		               
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" name="content" id="content"
								placeholder="내용을 입력 해주세요."></textarea>
						</div>
						<script>
						ClassicEditor
				        .create( document.querySelector( '#content' ), {
				             removePlugins: [ 'ImageUpload']
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
							<button type="button" class="btn btn-custom2 btn-block" onclick="history.back(-1);">취소</button>
							</div>
						</div>
					</div>
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->





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

var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

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

$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
	that.append(str);

	that.get(0).submit();
});

$("#datepicker").datepicker({
	startDate: new Date(),
	autoclose: true
	
});

</script>



<%@include file="../include/footer.jsp"%>
