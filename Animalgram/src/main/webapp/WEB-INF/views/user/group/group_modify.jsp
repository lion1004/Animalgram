<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	$(function() {
		var date = "${groupVO.gdate}".trim();
		var year = parseInt(date.substring(0, date.indexOf("년")));
		var mon = parseInt(date.substring(date.indexOf("년") + 1, date.indexOf("월")));
		var day = parseInt(date.substring(date.indexOf("월") + 1, date.length - 1));
		var setdate = new Date(year, mon - 1, day, 0, 0, 0, 0);

		$("#calendar").datepicker({
			minDate : 1,
			maxDate : "1M"
		});
		$("#calendar").datepicker("option", "dateFormat", "yy년 mm월 dd일");
		$("#calendar").datepicker("option", "showAnim", "show");
		$("#calendar").datepicker("setDate", setdate);
	});


	/* 우편번호 */
	function sample6_execDaumPostcode() {
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
				document.getElementById('gplace_address').value = fullAddr;

			}
		}).open();
	}
</script>

<div id="page-wrapper">

	<div class="container">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12" style="background: #ff8080; margin-top: 10px">
				<h1 class="page-header" style="color: #ffffff">
					소모임 수정하기 <small style="color: #222222">・゜゜・**・゜|*╹ω╹*|゜・**・゜゜・*</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<br> <br>
		<div class="row">
			<div class="col-lg-6">
				<form id="updateForm" action="/group/update?gno=${groupVO.gno}" role="form"
					method="post">
					<div class="form-group">
						<label>소모임 제목</label> <input id="grouptitle" name="gtitle" class="form-control"
							value="${groupVO.gtitle}" maxlength="30">
						<p class="help-block">특정 대상과 반려동물을 비하하는 내용의 글은 작성자 동의없이 삭제 될 수
							있음을 알려드립니다.</p>
					</div>
					<div class="form-group">
						<label>소모임 장소</label> <input class="form-control"
							readonly="readonly" type="text" name="gplace" id="gplace_address"
							placeholder="소모임 장소 찾기" value="${groupVO.gplace}"
							onclick="sample6_execDaumPostcode()">
					</div>
					<div class="form-group">
						<c:set var="date" value="${groupVO.gdate}" />
						<label>소모임 날짜</label> <input name="gdate" id="calendar"
							readonly="readonly" class="form-control">
						<p class="help-block">날짜를 선택해주세요. 당일 모임은 불가능 합니다.</p>
					</div>
					<div class="form-group">
						<label>소모임 인원</label> <select name="glimit" class="form-control">
							<c:set var="limit" value="${groupVO.glimit}" />
							<option value="2"
								<c:if test="${limit == 2 }">selected="selected"</c:if>>-기본값-</option>
							<option value="3"
								<c:if test="${limit == 3 }">selected="selected"</c:if>>3명</option>
							<option value="4"
								<c:if test="${limit == 4 }">selected="selected"</c:if>>4명</option>
							<option value="5"
								<c:if test="${limit == 5 }">selected="selected"</c:if>>5명</option>
							<option value="6"
								<c:if test="${limit == 6 }">selected="selected"</c:if>>6명</option>
							<option value="7"
								<c:if test="${limit == 7 }">selected="selected"</c:if>>7명</option>
							<option value="8"
								<c:if test="${limit == 8 }">selected="selected"</c:if>>8명</option>
							<option value="9"
								<c:if test="${limit == 9 }">selected="selected"</c:if>>9명</option>
							<option value="10"
								<c:if test="${limit == 10 }">selected="selected"</c:if>>10명</option>
							<option value="99"
								<c:if test="${limit == 99 }">selected="selected"</c:if>>제한없음</option>
						</select>
					</div>

					<div class="form-group">
						<label>참여가능 반려동물</label> <select name="gtype" class="form-control">
							<c:set var="type" value="${groupVO.gtype}" />
							<option <c:if test="${type eq '강아지' }">selected="selected"</c:if>>강아지</option>
							<option <c:if test="${type eq '고양이' }">selected="selected"</c:if>>고양이</option>
							<option <c:if test="${type eq '기타' }">selected="selected"</c:if>>기타</option>
						</select>
					</div>
					<div class="form-group">
						<label>모집 상태</label> <select name="gstate" class="form-control">
							<option>모집</option>
							<option>중단</option>
							<option>완료</option>
						</select>
					</div>

					<button type="button" id="groupupdate" class="btn btn-success">✿수정하기✿</button>
					<button type="reset" class="btn btn-danger"
						onclick="history.back()">✿뒤로가기✿</button>
				</form>
			</div>
			<!-- /.container-fluid -->


		</div>
	</div>
	<!-- /#page-wrapper -->
	<hr>
	<br>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<p>Copyright &copy; AnimalGram Corp. Make by 홍일점</p>
				</div>
			</div>
			<!-- /.row -->
		</div>
	</footer>
	<br>
</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#groupupdate").click(function(){
					if($("#grouptitle").val() == ""){
						alert("소모임 제목을 입력하세요.");
						$("#grouptitle").focus();	
					}else if($("#gplace_address").val() == ""){
						alert("소모임 장소를 정해주세요.");
						$("#gplace_address").focus();	
					}else if($("#calendar").val() == ""){
						alert("소모임 날짜를 정해주세요.");
						$("#calendar").focus();	
					}else{
						$("#updateForm").submit();
					}	
				});
			});
		</script>
