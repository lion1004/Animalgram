<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/navbar.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
textarea {
	resize: none;
}

hr.style15 {
	border-top: 4px double #8c8b8b;
	text-align: center;
}

hr.style15:after {
	content: '\002665';
	display: inline-block;
	position: relative;
	top: -15px;
	padding: 0 10px;
	background: #f0f0f0;
	color: #8c8b8b;
	font-size: 18px;
}
</style>
<div id="wrapper">
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid" style="margin-bottom: 80px;">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">고객센터 ${center.ctno }번 문의</h1>

					<form role="form">
						<input type='hidden' name='ctno' value="${center.ctno}">
						<input type='hidden' name='page' value="${cri.page}">
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
					</form>

					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">닉네임</label>
							<input type="text" name="nickname" class="form-control" value="${center.nickname}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label>
							<input type="text" name='cttitle' class="form-control" value="${center.cttitle}" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">문의내용</label>
							<textarea class="form-control" name="ctcontent" rows="12" readonly="readonly" maxlength="500">${center.ctcontent}</textarea>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="button" class="btn btn-info" id="goListBtn">목록으로</button>
						<button type="button" class="btn btn-primary" id="newReply">답변달기</button>
						<button type="button" class="btn btn-danger" id="delete">삭제</button>
						<hr class="style15">
						<!-- /.box -->
						<!-- timeline time label -->
						<div class="time-label" id="repliesDiv"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- wrapper -->

<script id="template" type="text/x-handlebars-template">
<div class="replyLi" data-ctno={{ctno}}>
	<div class="timeline-item" >
		<h4 class="timeline-header">
<i class="fa fa-comments bg-blue"></i> <strong>{{ctrtitle}}</strong></h4>
	<p class="timeline-body">{{ctrcontent}} </p>
		<div class="timeline-footer">
			<a class="btn btn-xs btn-default" href="/admin/cen_modify?ctno=${center.ctno}">수정</a>
			<a class="btn btn-xs btn-warning" href="/admin/cen_reply_delete?ctno=${center.ctno}">삭제</a>
		</div>
	</div>
</div>
</script>

<script type="text/javascript">
	var msg = '${msg}';
	if (msg != null && msg.trim().length > 1) {
		alert(msg);
	}

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}
	var ctno = '${center.ctno}';

	function getPage(pageInfo) { //getPage('/replies/15/1') url

		$.ajax({
			url : pageInfo,
			cache : false,
			success : function(data) {

				if (data[0] == null) {
					return;
				} else {
					//답변이 1개 이상일 시 더 이상 못달게 함
					$("#newReply").attr("disabled", "disabled");
					printData(data[0], $("#repliesDiv"), $('#template'));
				}
			//$("#modifyModal").modal('hide');
			}
		});
	}

	$(document).ready(function() {
		getPage("/admin/replies/all/" + ctno);

		$("#goListBtn") //목록
			.on("click", function() {
				self.location = "/admin/cen_list?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});

		$("#newReply").on("click", function() { //입력
			self.location = "/admin/cen_confirm?ctno=${center.ctno}";
		});


		$("#delete").on("click", function() {
			if (confirm("삭제하시겠습니까?")) {
				location.href = "/admin/cen_all_delete?ctno=${center.ctno}";
			}
		}); //delete
	});
</script>