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


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"></h3>
				</div>
				<!-- /.box-header -->

<form id='registerForm' name="confirm" role="form" method="post">
<!--     <input type="hidden" name="cuno" value="1"> -->
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">주문제작 상품명</label>
			 <input type="text" name="cutitle" class="form-control" placeholder="상품명을 입력 해주세요.">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">상품 가격</label>
			 <input type="text" name="cuprice" class="form-control" placeholder="상품가격을 입력 해주세요.">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">상품정보</label>
			<textarea class="form-control" name="cuinfo" rows="3"
				placeholder="상품 정보를 입력 해주세요."></textarea>
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">상품 이미지 파일을 드래그 해주세요.</label>
			<div class="fileDrop"></div>
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<div>
			<hr>
		</div>

		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>

		<button type="submit" class="btn btn-primary">등록하기</button>
	<a href="/user/custom/custom_list"><button type="button" class="btn btn-danger">취소</button></a>

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
</div>
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
<!-- <a href="{{fullName}}"  -->
<!--      class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a> -->
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


$("#registerForm").submit(function(event){
//$(".uploadedList .delbtn").on("click",function(event){
	event.preventDefault();<!-- event.preventDefault(): href 처리를 막아주고 단순 event만 진행되도록 해준다. -->
	
	if(document.confirm.cutitle.value == ""){
	alert('주문제작 상품명을 입력하십시오.');
	document.confirm.cutitle.focus();
	return;
	}else if(document.confirm.cuprice.value == ""){
		alert('상품 가격를 입력하십시오.');
	document.confirm.cuprice.focus();
	return;
	}else if (isNaN(document.confirm.cuprice.value)) {
			alert("상품가격은 숫자만 입력 가능합니다.")
			document.confirm.cuprice.focus();
			return;
	}else if(document.confirm.cuinfo.value == ""){
		alert('상품 정보를 입력하십시오.');
		document.confirm.cinfo.focus();
	return;
	}
	
	var that = $(this);
	var str ="";
 	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src") +"'> ";
	}); 
	
	that.append(str);
	
	if(str==""){alert('상품 이미지파일 등록해주세요.');
	return;}
	that.get(0).submit();
	
});

$(".uploadedList").on("click", "small", function(event){
	
	 var that = $(this);

  $.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("data-src")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){

			   that.parent("div").parent('li').remove();
		   	
		   }
	   }
  });
});

</script>

