<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>

<script type="text/javascript">
	//댓글입력 함수
	function areplybutton() {
		var rcontent = $("#rcontent").val();
		var antno = "${noticetextVO.antno}"
			$.ajax({
			type : "post",
			url : "/areply/rinfo",
			headers : {
				"Content-Type" : "application/json"
			},
			dateType : "text",
			data : JSON.stringify({antno : antno, rcontent : rcontent
			}),
			success : function() {
				document.areply_confirm_form.rcontent.value = "";
				listareplyRest("1");
			}
		});
	}//areplybutton
		
	//댓글 목록 출력
	function listareplyRest(num) {
		$.ajax({
			type : "get",
			url : "/areply/all/${noticetextVO.antno}/"+num,
			success : function(result) {
				// responseText가 result에 저장됨.
				$("#listareply").html(result);
			}
		});
	}//listareplyRest
	
	//댓글수정 수정 함수
	function showReplyModify(arno){
		$.ajax({
			type : "get",
			url: "/areply/detail/"+arno,
			success: function(result){
				$(".updateareply"+arno).html(result);
			}
		})
	}//showReplyModify
	
	//댓글수정 닫기 함수
	function closedReply(arno){
		$(".btnModify"+arno).attr("onclick","showReplyModify("+arno+")");
		$(".btnModify"+arno).val("수정");
		$(".updateareply"+arno).html("");
	}//closedReply

	$(document).ready(function() {
		var formObj = $("form[role='form']");
		//게시글 수정 버튼
		$("#updatebutton").on("click", function() {
			formObj.attr("action", "/aboard/kupdate");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		//게시글 삭제 버튼
		$("#deletebutton").on("click", function() {
			formObj.attr("action", "/aboard/kremove");
			formObj.submit();
		});
		
		//리스트 이동 버튼
		$("#listbutton").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/aboard/klist");
			formObj.submit();
		});
		
		//댓글입력
		$("#areplybutton").click(function() {
			if(document.areply_confirm_form.rcontent.value == ""){
				alert("댓글을 입력해주세요")
				document.areply_confirm_form.rcontent.focus();
			}else{
				areplybutton();
			}
		});
		
		//댓글목록
		listareplyRest("1");
	});//ready
	
</script>

	<form role="form" action="kupdate" method="post">
		<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">
		<input type='hidden' name='antno' id="antno"value="${noticetextVO.antno}">
		<input type='hidden' name='ntno' value="${noticetextVO.ntno}">
		<input type='hidden' name='nno' value="${noticetextVO.nno}">
	</form>
	
	<div id="wrapper">
		<div id="page-wrapper">
			<!-- 게시판 헤더 -->
			<div class="container-fluid">
				<h1 class="page-header">게시판</h1>
			</div>
			<div class="panel panel-yellow" style="width: 1000px; margin: 0 auto;">
				<div class="panel-heading">
					<h3 class="panel-title">글 내용</h3>
				</div>
				<br>
				<!-- 게시판 상세 내용 보기 -->
				<div class="panel-body">
					<div class="col-lg-12">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="ntitle" value="${noticetextVO.ntitle}" readonly><br>
							<label>작성자 <input class="form-control" name="nickname" id="nickname" value="${noticetextVO.nickname}" style="width: 100px;" readonly></label>&nbsp;
							<label>작성일자 <input class="form-control" name="ntdate" value="${noticetextVO.ntdate}" style="width: 150px" readonly></label>&nbsp;
							<label>조회수 <input class="form-control" name="ncount" value="${noticetextVO.ncount}" style="width: 100px" readonly></label>
						</div>
						<div class="form-group">
							<label>내용</label>
							<div class="form-control" id="ntcontent" style="overflow-y:scroll; width:970px; height:500px;">${noticetextVO.ntcontent}</div>
						</div>
						<div class="form-group">
							<c:if test="${noticetextVO.nickname == user}">
								<button type="submit" class="btn btn-success" id="updatebutton">수정</button>
								<button type="submit" class="btn btn-danger" id="deletebutton">삭제</button>
								<button type="submit" class="btn btn-info" id="listbutton">리스트</button>
							</c:if>
							<c:if test="${noticetextVO.nickname != user}">
								<button type="submit" class="btn btn-info" id="listbutton">리스트</button>
							</c:if>
						</div>
						
					<!-- 댓글 작성 폼 -->
					<c:if test="${noticetextVO.nickname == user}">
					<form name="areply_confirm_form">
						<div class="well" style="width: 970px">
							<div class="form-group">
								<label>댓글 : </label> 
								<textarea class="form-control" rows="3" name="rcontent" id="rcontent" placeholder="댓글을 작성해주세요" style="resize: none"></textarea>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary" id="areplybutton">댓글 작성</button>
							</div>
						</div>
					</form>
					</c:if>
						<!-- 댓글 리스트 출력 -->
						<label>댓글목록 : </label><hr>
						<div class="well" style="width: 970px">
						<div id="listareply"><hr></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>