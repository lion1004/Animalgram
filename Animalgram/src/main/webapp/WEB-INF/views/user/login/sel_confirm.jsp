<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrapPro/css/petUp.css?ver=1.3">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
/* 우편번호 */
function addrnofind() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('sample6_address').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('sample6_address2').focus();
		}
	}).open();
}
	function checksel(){
	document.selform.submit();
	}

	$(function() {

		$('#seller_confirm').click(function() {
			if(${job == 'seller'}){
				alert('이미 등록되어 있습니다.');
			}else
			if(${job == 'pro'}){
				alert('전문가로 등록되었습니다.');
			}else
			$('#selModal').modal();
		});
	});
</script>


<!-- line modal -->
<div class="modal fade" id="selModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">판매자 등록</h3>
			</div>
				<form action="sel_insert" method="post" name="selform">
			<div class="modal-body">

				<!-- content goes here -->
					<div class="form-group">
					<input type="hidden" name="nickname" value="${user }">
						<label for="exampleInputEmail1">상호명 : </label> 
						<input type="text" class="form-control" 
							name="sname" placeholder="상호명 작성">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">판매자 [사업자]번호 : </label> 
						<input type="text" class="form-control"  name="stel" placeholder="사업자 번호">
					</div>
					<div class="form-group">
				<label for="exampleInputEmail1">주소 : </label>
					<input type="text" class="form-control" name="addrno" id="sample6_postcode" placeholder="우편번호" >
					<input class="btn btn-success" type="button" onclick="addrnofind()" style="width: 130px;" value="우편번호 찾기"><br>
					</div>
			<div class="form-group">
				<input type="text" class="form-control" name="addr1" id="sample6_address" placeholder="주소" style="width: 300px"><br><br>
				<input type="text" class="form-control" name="addr2" id="sample6_address2" placeholder="상세주소" style="width: 300px">
				<br><br>
			</div>
			</div>
			</form>

				<div class="btn-group btn-group-justified" role="group" aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" onclick="checksel()" class="btn btn-default btn-hover-green">Save</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-dismiss="modal" role="button">Close</button>
					</div>
				</div>
		</div>
	</div>
</div>