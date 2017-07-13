<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../base/main.jsp"%>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">수정 페이지</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">주문제작번호</label> <input type="text"
								name='cuno' class="form-control" value="${customVO.cuno}"
								readonly="readonly">
					
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">상품명</label> <input type="text"
								name='cutitle' class="form-control" value="${customVO.cutitle}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">상품정보</label>
							<textarea class="form-control" name="cinfo" rows="3">${customVO.cinfo}</textarea>
						</div>
					
			
						
						<div class="form-group">
							<label for="exampleInputEmail1">상품 이미지를 드래그 하십시오.</label>
							<div class="fileDrop"></div>
						</div>
						
						<ul class="mailbox-attachments clearfix uploadedList"></ul>

<!-- 첨부파일 X클릭시 삭제 -->
<script id="templateAttach" type="text/x-handlebars-template">
<li>
<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<small data-src="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></small>
	</span>
  </div>
</li>                
</script> 
					</div>
					<!-- /.box-body -->
	</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<small data-src="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></small>
	</span>
  </div>
</li>                
</script>
<script>
$(document).ready(
	function() {
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
					  console.log(fileInfo);
					  var html = template(fileInfo);
					  console.log(html);
					//  alert('check:'+html)
					  $(".uploadedList").append(html);
				  }
				});	
		});
		
		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/user/custom/seller_list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
			var that = $("form[role='form']");
			var str ="";
			$(".uploadedList .delbtn").each(function(index){
//		 		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
				 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
			});
			that.append(str);
			alert('str: '+str);
					formObj.submit();
				});
		
		var cuno = ${customVO.cuno};
		var template = Handlebars.compile($("#templateAttach").html());
		$.getJSON("/user/custom/getAttach/"+cuno,function(list){
			$(list).each(function(){
			
				var fileInfo = getFileInfo(this);
				
				var html = template(fileInfo);
				
				 $(".uploadedList").append(html);
				console.log(fileInfo);
			});
		});
		
		
		$(".uploadedList").on("click", "small", function(event){
			
			 var that = $(this);

		  $.ajax({
			   url:"/user/custom/removeFile",
			   type:"post",
			   data: {cuno: cuno, fileName:$(this).attr("data-src")},
			   dataType:"text",
			   success:function(result){
				   if(result == 'deleted'){
					   alert('삭제됩니다');
					   that.parent("div").parent('li').remove();
				   	   alert('삭제 됐나요?');
				   }
			   }
		  });
		});
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
</div>
<!-- /.content-wrapper -->

