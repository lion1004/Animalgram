<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrapPro/css/petUp.css?ver=1.3">

<script type="text/javascript">

	function checkpro(){
		alert('전문가 등록')
	document.proform.submit();
	}

	$(function() {
		$('#pro_confirm').click(function() {
			if(${job == 'seller'}){
				alert('판매자로 등록되어 있습니다.');
			}else
			if(${job == 'pro'}){
				alert('이미 등록되었습니다.');
			}else
			$('#proModal').modal();
		});
	});
</script>


<!-- line modal -->
<div class="modal fade" id="proModal" tabindex="-1"
	role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">전문가 등록</h3>
			</div>
		<form action="pro_insert" method="post" name="proform" enctype="multipart/form-data">
			<div class="modal-body">

				<!-- content goes here -->
					<div class="form-group">
					<input type="hidden" name="nickname" value="${user }">
						<label for="exampleInputEmail1">전문 분야</label> 
						<select class="form-control" name = "ptype">
								<option>--선택--</option>
								<option>펫 행동교정</option>
								<option>펫 의료관련</option>
								<option>펫 사료관련</option>
								<option>기타</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전문가 [자격증]번호</label> 
						<input type="text" class="form-control" id="ptypeno" name="ptypeno" placeholder="자격증 번호">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전문경력</label> 
						<input type="text" class="form-control" id="pettype" name="pcareer1" placeholder="ex) 1년" style="width: 120px; display: inline-block;">
						<select class="form-control" name = "pcareer2" style="width: 150px;">
							<option>--선택--</option>
							<option>개월</option>
							<option>년</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전문가 프로필</label> 
						<input type="file" name="proimage" >
						<p class="help-block">전문가 프로필을 등록하세요.</p>
					</div>
			</div>
			</form>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" id="savePet" onclick="checkpro()" class="btn btn-default btn-hover-green">Save</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal" role="button">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>