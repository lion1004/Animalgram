<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>

<!-- include summernote css/js-->
<link href="/resources/summernote/dist/summernote.css" rel="stylesheet">
<script src="/resources/summernote/dist/summernote.js"></script>

<!-- summer note korean language pack -->
<script src="/resources/summernote/dist/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
	//노하우 게시판 수정 창 유효성 검사
	function knowhow_modify_check(){
		var ntcontent = $('.summernote').summernote('code');
		$('#ntcontent').val(ntcontent);
		
		if(document.knowhow_modify_form.ntitle.value == ""){
			alert('제목을 입력하세요.');
			document.knowhow_modify_form.ntitle.focus();
		}else if(ntcontent == ""){
			alert('내용을 입력하세요.');
		}else{
			document.knowhow_modify_form.submit();
		}
	}// knowhow_modify_check
	
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
		
		$('.summernote').summernote('code', '${noticetextVO.ntcontent}');
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
			<div class="container-fluid">
				<h1 class="page-header">게시판</h1>
			</div>
			<div class="panel panel-yellow" style="width: 1000px; margin: 0 auto;">
				<div class="panel-heading">
					<h3 class="panel-title">글 수정</h3>
				</div>
				<br>
				<div class="panel-body">
					<div class="col-lg-12">
						<form role="form" action="kupdate" method="post" name="knowhow_modify_form">
						<input type='hidden' name='ntno' value="${noticetextVO.ntno}"> 
						<input type='hidden' name='nno' value="${noticetextVO.nno}"> 
						<input type="hidden" id="ntcontent" name="ntcontent">
							<div class="form-group">
									<label>제목</label>
										<input class="form-control" name="ntitle" value="${noticetextVO.ntitle}">
							</div>
							<div class="form-group">
									<label>작성자 
										<input class="form-control" name="nickname" value="${noticetextVO.nickname}" style="width: 100px" readonly></label>	
							</div>
							<div class="form-group">
									<label>내용</label><input class="summernote">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-success" onclick="knowhow_modify_check()">수정</button>
								<a href='/aboard/kinfo?ntno=${noticetextVO.ntno}&nno=${noticetextVO.nno}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType${cri.searchType}&keyword=${cri.keyword}'>
									<button type="button" class="btn btn-danger">취소</button>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>