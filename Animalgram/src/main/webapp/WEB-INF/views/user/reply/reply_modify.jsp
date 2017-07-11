<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	var arno = ${vo.arno};
		$(".btnModify"+arno).val("닫기");
		$(".btnModify"+arno).attr("onclick","closedReply("+arno+")");
	
	$(document).ready(function(){
		
		//댓글 수정
		$(".btnReplyUpdate"+arno).click(function(){
			var rcontent = $("#rcontentup").val();
			if(rcontent == "") {alert('댓글을 입력하세요'); return;}
				$.ajax({
					url: "/areply/rupdate/"+${vo.arno},
					type: "put",
					headers: { 
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "PUT" },
				dataType:'text', 
				data:JSON.stringify({rcontent:rcontent}), 
					success: function(){
							$(".updateareply"+arno).css("visibility", "hidden");
							listareplyRest("1");
						}
					})
				});
		
		//댓글 삭제
		$(".btnReplyDelete"+arno).click(function(){
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type: "delete",
					url: "/areply/rremove/"+${vo.arno},
					success: function(result){
						if(result == "SUCCESS"){
							alert("삭제되었습니다.");
							$(".updateareply"+arno).css("visibility", "hidden");
							listareplyRest("1");
						}
					}
				});
			}
		});
	});//ready
</script>
	<form name="areply_modify_form">
		<div class="well" style="width: 930px;">
			<div class="form-group">
				<label>작성자 : ${vo.nickname}</label><br><br>
				<textarea class="form-control" rows="3" id="rcontentup" name="rcontentup">${vo.rcontent}</textarea>
			</div>
			<div class="form-group">
				<!-- 본인 댓글만 수정, 삭제가 가능하도록 처리 -->
				<c:if test="${vo.nickname == user}">
					<button type="button" class="btn btn-xs btn-success btnReplyUpdate${vo.arno}">수정</button>
					<button type="button" class="btn btn-xs btn-danger btnReplyDelete${vo.arno}">삭제</button>
				</c:if>
			</div>
		</div>
	</form>
