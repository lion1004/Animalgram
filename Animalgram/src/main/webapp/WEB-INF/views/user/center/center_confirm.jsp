<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>

<script type="text/javascript">
	//고객센터 글쓰기 창 유효성 검사
	function center_confirm_check(){
		if(document.center_confirm_form.cttitle.value == ""){
			alert('제목을 입력하세요.')
			document.center_confirm_form.cttitle.focus();
		}else if(document.center_confirm_form.ctcontent.value == ""){
			alert('내용을 입력하세요.')
			document.center_confirm_form.ctcontent.focus();
		}else{
			document.center_confirm_form.submit();
		}
	}
</script>
<div id="wrapper">
	<div id="page-wrapper">
		<div class="container-fluid">
			<h1 class="page-header">FAQ & 1:1문의</h1>
			<%@include file="../center/center_faq_list.jsp"%>
			<hr>
		</div>
			<div class="panel panel-yellow" style="width: 1000px; margin: 0 auto;">
					<div class="panel-heading">
						<h3 class="panel-title">1:1문의</h3>
					</div>
					<br>
					<!-- 글쓰기 내용 입력 -->
					<div class="panel-body">
						<div class="col-lg-12">
							<form role="form" method="post" name="center_confirm_form" action="/center/cinsert">
								<input type="hidden" name="nickname" value="${user}">
								<div class="form-group">
									<label>제목</label> <input class="form-control" name="cttitle">
								</div>
								<div class="form-group" style="width: 650px" >
									<label>내용</label> <textarea rows="10" cols="60" style="width: 650px" name="ctcontent" id="ctcontent"></textarea>
								</div>
							<div class="form-group">
								<button type="button" class="btn btn-success" onclick="center_confirm_check()">등록</button>
								<a href='/aboard/clist'><button type="button" class="btn btn-danger">취소</button></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>