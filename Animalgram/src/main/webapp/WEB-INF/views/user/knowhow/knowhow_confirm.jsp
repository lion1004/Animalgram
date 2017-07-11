<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>

<!-- include summernote css/js-->
<link href="/resources/summernote/dist/summernote.css" rel="stylesheet">
<script src="/resources/summernote/dist/summernote.js"></script>

<!-- summer note korean language pack -->
<script src="/resources/summernote/dist/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
	//노하우게시판 글쓰기 창 유효성검사 
	function knowhow_confirm_check(){
		if(document.knowhow_confirm_form.ntitle.value == ""){
			alert('제목을 입력하세요.')
			document.knowhow_confirm_form.ntitle.focus();
		}else if(document.knowhow_confirm_form.ntcontent.value == ""){
			alert('내용을 입력하세요.')
			document.knowhow_confirm_form.ntcontent.focus();
		}else{
			document.knowhow_confirm_form.submit();
		}
	}
	
	//summernote
	$(function() {
		$('.summernote').summernote({
			height : 350,
			lang : 'ko-KR',
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					sendFile(files[0], editor, welEditable);
				}
			}
		});
	});
	
	function sendFile(file, editor, welEditable) {
		data = new FormData();
		data.append("image", file);
		$.ajax({
			data : data,
			type : "POST",
			// 이미지 업로드하는 파일 path 
			url : '/aboard/imageUpload',
			cache : false,
			contentType : false,
			processData : false,
			success : function(url) {
				$(".summernote").summernote('insertImage',url);
			}
		});
	}
</script>

	<div id= "wrapper">
		<div id="page-wrapper">
			<!-- 질문답변 게시판 헤더 -->
			<div class="container-fluid">
				<h1 class="page-header">게시판</h1>
			</div>
			<div class="panel panel-yellow" style="width: 1000px; margin: 0 auto;">
				<div class="panel-heading">
					<h3 class="panel-title">글 입력</h3>
				</div>
				<br>
				<!-- 글쓰기 내용 입력 -->
				<div class="panel-body">
					<div class="col-lg-12">
						<form role="form" method="post" name="knowhow_confirm_form" action="/aboard/kinsert" >
							<input type="hidden" name="nickname" value="${user}">
							<div class="form-group">
								<label>제목</label> <input class="form-control" name="ntitle">
							</div>
							<div class="form-group">
								<label>내용</label> <textarea name="ntcontent" id="ntcontent" class="summernote"></textarea>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-success" onclick="knowhow_confirm_check()">등록</button>
								<a href='/aboard/klist'><button type="button" class="btn btn-danger">취소</button></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>