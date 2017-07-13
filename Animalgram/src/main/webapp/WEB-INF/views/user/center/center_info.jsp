<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		//리스트 이동 버튼
		$("#listbutton").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/center/clist");
			formObj.submit();
		});
	});//ready
	
</script>

	<form role="form" method="post">
		<input type='hidden' name='ctno' value="${CenterVO.ctno}">
		<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>
	
	<div id="wrapper">
		<div id="page-wrapper">
			<!-- 게시판 헤더 -->
			<div class="container-fluid">
				<h1 class="page-header">1:1문의</h1>
			</div>
			<div class="panel panel-yellow" style="width: 600px; margin: 0 auto;">
				<div class="panel-heading">
					<h3 class="panel-title">1:1문의 내용</h3>
				</div>
				<br>
				<!-- 게시판 상세 내용 보기 -->
				<div class="panel-body">
					<div class="col-lg-12">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="cttitle" value="${CenterVO.cttitle}" readonly><br>
							<label>작성자 <input class="form-control" name="nickname" id="nickname" value="${CenterVO.nickname}" style="width: 100px;" readonly></label>&nbsp;
							<label>상태<input class="form-control" name="ctstate" value="${CenterVO.ctstate}" style="width: 150px" readonly></label>&nbsp;
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" id="ctcontent">${CenterVO.ctcontent}</textarea>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-info" id="listbutton">리스트</button>
						</div>
					</div>
				</div>
						<div class="time-label" id="repliesDiv"></div>
			</div>
		</div>
	</div>
	<script id="template" type="text/x-handlebars-template">
	<div class="replyLi" data-ctno={{ctno}}>
		<div class="timeline-item" >
			<h4 class="timeline-header">
	<i class="fa fa-comments bg-blue"></i> <strong>{{ctrtitle}}</strong></h4>
		<p class="timeline-body">{{ctrcontent}} </p>
			<div class="timeline-footer">
			</div>
		</div>
	</div>
	</script>
	
	<script type="text/javascript">
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		target.after(html);

	}
	var ctno = '${CenterVO.ctno}';

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
			}
		});
	}

	$(document).ready(function() {
		getPage("/center/replies/all/${CenterVO.ctno}");

	});
</script>