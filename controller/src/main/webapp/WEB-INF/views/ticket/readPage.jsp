<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript" src="/resources/js/handlebars.js"></script>
<!-- Main content -->
<div class='popup back' style="display: none;"></div>
<div id="popup_front" class='popup front' style="display: none;">
	<img id="popup_img">
</div>
<section class="content-header">
          <h1>
            #<c:out value="${boardVO.bno}"/>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"> Home</a></li>
            <li><a href="/ticket/list"> 서비스요청</a></li>
            <li class="active"><c:out value="${boardVO.bno}"/></li>
          </ol>
</section>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-sm-9">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header">
						<div class="row">
						<div class="col-sm-1">
						<c:if test="${boardVO.writer eq 'cpadmin' }">
						<img src="/resources/dist/img/fox_128px.png" class="user-image" alt="User Image" style="max-width:45px; height:auto;"/>
						</c:if>
						<c:if test="${boardVO.writer ne 'cpadmin' }">
						<img src="/resources/dist/img/elephant_128px.png" class="user-image" alt="User Image" style="max-width:45px; height:auto;"/>
						</c:if>
						</div> 
						<div class="col-sm-11">  
						<h3 class="box-title"> <c:out value="${boardVO.title}"/>  </h3> <br/>
						<p>
						작성일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/>
						 / 조회수 : <c:out value="${boardVO.viewcnt}"/>
						</p> 
						</div>
						
						
				</div>
				<hr/>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='bno' value="${boardVO.bno}"> <input
						type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>

				<div class="box-body">
					<div class="form-group" style="min-height: 200px;">
					<p><b>내용</b></p>
							<c:out value="${boardVO.content}" escapeXml="false" />
					</div>
					
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
					
						<c:if test="${login.uid eq boardVO.writer || login.ugrade eq '2'}">
							<button type="submit" class="btn btn-custom2" id="modifyBtn">수정</button>
							<button type="submit" class="btn btn-custom1" id="removeBtn">삭제</button>
						</c:if>
							<button type="submit" class="btn btn-default" id="goListBtn">목록</button>
				</div>
			</div>
			<!-- /.box -->	
		</div>
		<!--/.col (left) -->
	<div class="col-sm-3">
          <div class="box box-default" style="min-height:364px;">
            <div class="box-header with-border">
              <h3 class="box-title">#<c:out value="${boardVO.bno}"/></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="">
              <p>
              <label>작성자 : </label>
              <c:out value="${boardVO.writer}"/>
              </p>
              <p>
              <label>분류 : </label>
              <c:out value="${boardVO.category}"/></p>
             
              <p><c:if test="${boardVO.duedate ne null }">
              <label>완료 예정 : </label>
			  <c:out value="${boardVO.duedate}"/>
			  </c:if></p>
			  
			  <p><c:if test="${boardVO.priority ne null }">
			  <label>중요도 : </label>
			  <c:out value="${boardVO.priority}"/> 
			  </c:if></p>
			  
			  <p><c:if test="${boardVO.status ne null }">
			  <label>상태 :  </label>
			  <c:out value="${boardVO.status}"/> 
						
				<div class="progress progress-xs">
					<c:if test="${boardVO.status eq 'Open'}">
					<div class="progress-bar progress-bar-primary" style="width: 25%"></div>
					</c:if>
					<c:if test="${boardVO.status eq 'In Progress'}">
                    <div class="progress-bar progress-bar-yellow" style="width: 50%"></div>
                    </c:if>
                    <c:if test="${boardVO.status eq 'Resolved'}">
                     <div class="progress-bar progress-bar-custom2" style="width: 75%"></div>
                    </c:if>
                    <c:if test="${boardVO.status eq 'Closed'}">
                     <div class="progress-bar progress-bar-custom3" style="width: 100%"></div>
                    </c:if>
                </div> 
	            </c:if></p>
	            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
	</div>
	<!-- /.row -->



	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<!-- <div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div> -->
				<div class="box-body">
					<div class="row">
						<div class="col-xs-10">
						<!-- <label for="exampleInputEmail1">Writer</label>  -->
						<input
							class="form-control" type="hidden" placeholder="USER ID"
							id="newReplyWriter" value="${login.uid}" readonly="readonly">
							<input class="form-control" type="text"
							placeholder="REPLY TEXT" id="newReplyText">
						</div>
						<div class="col-xs-2">
						<button type="button" class="btn btn-custom1 btn-block" id="replyAddBtn">
						댓글 작성 </button>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>


			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-custom2">
						<i class="fa fa-comments-o margin-r-5"></i> 달린 댓글 <small id='replycntSmall' > (${boardVO.replycnt}) </small>
				</span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->



	<!-- Modal -->
	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-custom2" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-custom1" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</section>
<!-- /.content -->


<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>



<script id="template" type="text/x-handlebars-template">
				{{#each .}}
	         <li class="replyLi" data-rno={{rno}}>
             <i class="fa fa-comments bg-blue"></i>
             <div class="timeline-item" >
                <span class="time">
                  <i class="fa fa-clock-o"></i> {{prettifyDate regdate}}
                </span>
                <h3 class="timeline-header"><strong> <b>#</b>{{rno}}</strong> by {{replyer}}</h3>
                <div class="timeline-body">{{replytext}} </div>
								<div class="timeline-footer">
								{{#eqReplyer replyer }}
                  <a class="btn btn-custom2 btn-xs" 
									data-toggle="modal" data-target="#modifyModal">Modify</a>
								{{/eqReplyer}}
							  </div>
	            </div>			
           </li>
        {{/each}}
</script>

<script>
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${login.uid}') {
			accum += block.fn();
		}
		return accum;
	});
	
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var bno = ${boardVO.bno};
	
	var replyPage = 1;

	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
			printData(data.list, $("#repliesDiv") ,$('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
			
		});
	}



	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

/* 	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");

	}); */
	
	/*페이지로딩될때 바로 적용 가능하기 */
	$(document).ready(function(){
		
		console.log("AAAAAAAAAAAAAAAAAAAAAAAA");

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");
	})
	
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+bno+"/"+replyPage);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("댓글이 등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+bno+"/"+replyPage );
						replytextObj.val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});
	

$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/ticket/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	

	
	$("#removeBtn").on("click", function(){
		
		var replyCnt =  ${boardVO.replycnt};
		
		if(replyCnt > 0 ){
			alert("댓글이 달려있는 게시물은 삭제할 수 없습니다.");
			return;
		}	
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
			});
		}
		
		formObj.attr("action", "/ticket/removePage");
		formObj.submit();
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/ticket/list");
		formObj.submit();
	});
	
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html());
	
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
	
		
	
});

function goLogin(){
	self.location ="/user/login";
}
</script>


<%@include file="../include/footer.jsp"%>
