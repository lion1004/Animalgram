<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrapPro/css/petUp.css?ver=1.3">

<script type="text/javascript">

	function check1(){
		alert('애완견 등록');
		document.petform.submit();
	}

	$(function() {
		$('#animal_confirm').click(function() {
			$('#squarespaceModal').modal();
		});
	});
</script>


<!-- line modal -->
<div class="modal fade" id="squarespaceModal" tabindex="-1"
	role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">나의 펫 등록</h3>
			</div>
				<form action="pet_insert" method="post" name="petform" enctype="multipart/form-data">
			<div class="modal-body">

				<!-- content goes here -->
					<div class="form-group">
					<input type="hidden" name="nickname" value="${user }">
						<label for="exampleInputEmail1">나의 펫 이름</label> <input
							type="text" class="form-control" id="petname" name="aname" placeholder="펫 이름">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">나의 펫 성별</label>
						<label class="radio_text">
						<input type="radio" name="agender"
							value="hoge" checked>수컷
						</label> <label class="radio_text">
						 <input type="radio"
							name="agender" value="hoge">암컷
						</label>
						<label class="radio_text">
						 <input type="radio"
							name="agender" value="hoge">중성화
						</label>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">나의 펫 나이</label> <input
							type="text" class="form-control" id="petage"
							name="aage" placeholder="나의 펫 나이">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">나의 펫 종</label> <input
							type="text" class="form-control" id="pettype"
							name="atype" placeholder="ex) 시츄,푸들">
					</div>
					<div class="form-group">
						<label for="exampleInputFile">File input</label> <input
							type="file" name="image" id="petimage">
						<p class="help-block">나의 펫 사진을 등록하세요.</p>
					</div>
			</div>
			</form>
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group"
					aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" id="savePet" onclick="check1()"
							class="btn btn-default btn-hover-green">Save</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							role="button">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>