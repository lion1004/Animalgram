<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

function upcheck() {
	alert('비번 : ' +document.up_form.mpass.value)
	if ($('#upmpass').val() == "") {
		alert("비밀번호를 입력하세요.");
		$('#upmpass').focus();
	} else if ($('#upconfirmPwd').val() == "") {
		alert("비밀번호 확인을 입력하세요.");
		$('#upconfirmPwd').focus();
    } else if ($('#upaddrno').val() == "") {
		alert("우편번호를 입력하세요.");
		$('#upaddrno').focus();
		} else if ($('#upaddr1').val() == "") {
		alert("주소를 입력하세요.");
		$('#upaddr1').focus();
	} else if ($('#upaddr2').val() == "") {
		alert("상세 주소를 입력하세요.");
		$('#upaddr2').focus();
	} else if ($('#upmtel').val() == "") {
		alert("연락처를 입력하세요.");
		$('#upmtel').focus();
	 } else if (isNaN($('#upmtel').val())) {
		alert("연락처는 숫자만 입력 가능합니다.")
		$('#upmtel').focus(); 
	} else{
		document.up_form.submit();
		alert('submit')
	}
}


/* 우편번호 */
function addrNoFound() {
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
			document.getElementById('upaddrno').value = data.zonecode; //5자리 새 우편번호 사용
			document.getElementById('upaddr1').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('upaddr2').focus();
		}
	}).open();
}

	

	function uppwC() {
		var pass = $('#upmpass').val();
		var passc = $('#upconfirmPwd').val();

		if (pass != passc) {
			document.getElementById("uppwCheck").innerHTML = "비밀번호가 일치하지 않습니다.";
			$("#uppwCheck").css("color", "red");
			return false;
		}
		if (pass == passc) {
			document.getElementById("uppwCheck").innerHTML = "비밀번호가 일치합니다.";
			$("#uppwCheck").css("color", "black");
		}
	}

	function uppwdChk() {
		var pw = $('#upmpass').val();

		var reg = /^[a-zA-Z0-9~!@#$%<>^&*\()\-=+_\’]{6,15}$/;
		if (!reg.test(pw)) {
			document.getElementById("msg").innerHTML = "· 6~15자의 영문, 숫자로 조합으로 입력";
			$("#msg").css("color", "black");
			return false;
		}

		var regSmall = /[a-z]/g;
		var regCapital = /[A-Z]/g;
		var regNumber = /[0-9]/g;
		var regSpecial = /[~!@#$%<>^&*\()\-=+_\’]/g;

		var regArr = [ '', '', '', '' ];
		regArr[0] = pw.search(regSmall);
		regArr[1] = pw.search(regCapital);
		regArr[2] = pw.search(regNumber);
		regArr[3] = pw.search(regSpecial);

		var count = 0;

		for (var i = 0; i < regArr.length; i++) {
			if (regArr[i] >= 0)
				count++;
		}

		if (count == 1) {
			document.getElementById("msg").innerHTML = "보안 강도 : 하";
			$("#msg").css("color", "red");
		} else if (count == 2) {
			document.getElementById("msg").innerHTML = "보안 강도 : 중";
			$("#msg").css("color", "orange");
		} else if (count == 3) {
			document.getElementById("msg").innerHTML = "보안 강도 : 상";
			$("#msg").css("color", "green");
		} else if (count == 4) {
			document.getElementById("msg").innerHTML = "보안 강도 : 최상";
			$("#msg").css("color", "blue");
		} else {
			document.getElementById("msg").innerHTML = "ERROR";
			$("#msg").css("color", "red");
		}
	}
	
</script>
		<form class="form-horizontal" name="up_form" id="up_form" action="modify_mem" method="post">
<article class="row">
	<div class="col-md-12">
			<div class="form-group">
				<label style="width: 120px">아이디(이메일)</label>
				<div style="display: inline">
				<input type="hidden" name="idmail" value="${mem.idmail }">
					<label style="width: 120px">${mem.idmail }</label>
				</div>
			</div>
			<div class="form-group">
			<form>
				<label for="upmpass" style="width: 120px">비밀번호</label>
				<div style="display: inline">
					<input class="form-control" id="upmpass" type="password" size="8" name="mpass" maxlength="15" placeholder="비밀번호" style="width: 300px;" onkeyup="uppwdChk()">
					<p class="help-block">
						<b id="msg" style="color: red; font-size: 8pt;"></b>
					</p>
				</div>
			</form>
			</div>
			<div class="form-group">
				<label for="upconfirmPwd" style="width: 120px">비밀번호 확인</label>
				<div style="display: inline">
					<input class="form-control" id="upconfirmPwd" type="password" size="8" name="confirmPwd" placeholder="비밀번호 확인" maxlength="15" style="width: 300px;" onkeyup="uppwC()">
					<p class="help-block">
						<b id="uppwCheck" style="color: red; font-size: 8pt;"></b>
					</p>
				</div>
			</div>
			<div class="form-group">
				<label style="width: 120px">이름</label>
				<div style="display: inline">
				<label style="width: 120px">${mem.mname }</label>
				</div>
			</div>
			<div class="form-group">
				<label style="width: 120px">성별</label>
				<div style="display: inline">
					<label style="width: 120px">${mem.mgender}</label>
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" style="width: 120px">닉네임</label>
				<label>${mem.nickname } </label>
			</div>
			<div class="form-group">
				<label style="width: 120px">생년월일</label>
				<div style="display: inline">
					<label style="width: 120px">${mem.birth }</label>
				</div>
			</div>

			<div class="form-group">
				<label for="inputName" style="width: 120px" >주소</label>
				<div style="display: inline">
					<input type="text" name="addrno" id="upaddrno" value="${mem.maddr.split('/')[0] }" style="width: 50px;"> 
					<input class="btn btn-success" type="button" onclick="addrNoFound()" value="우편번호 찾기" style="width: 125px;">
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" style="width: 120px"></label>
				<div style="display: inline">
					<input type="text" class="form-control" name="addr1" value="${mem.maddr.split('/')[1] }" id="upaddr1" placeholder="주소" style="width: 380px;" >&nbsp;&nbsp; 
					<input type="text" class="form-control" name="addr2" value="${mem.maddr.split('/')[2] }" id="upaddr2" placeholder="상세주소" style="width: 170px;">
				</div>
			</div>
			<div class="form-group">
				<label for="upmtel" style="width: 120px">전화번호</label>
				<div style="display: inline">
					<input class="form-control" id="upmtel" type="text" name="mtel" placeholder="'-'없이 입력해 주세요." value="${mem.mtel }" maxlength="11" style="width: 200px">
				</div>
			</div>
			<div class="form-group">
				<label for="inputNumber" style="width: 120px">관심분야</label>
				<div style="display: inline">
					<input type="radio" name="favorite" value="dog" ${mem.favorite == 'dog' ? 'checked' : '' }>강아지
					<input type="radio" name="favorite" value="cat" ${mem.favorite == 'cat' ? 'checked' : '' }>고양이 
					<input type="radio" name="favorite" value="etc" ${mem.favorite == 'etc' ? 'checked' : '' }>기타
					
				</div>
			</div>

			<div class="form-group">
				<div class="col-xs-12">
					<br>
					<input type="button" class="btn btn-lg btn-warning" onclick="upcheck()" value="save">
					<button class="btn btn-lg" type="reset">
						<i class="glyphicon glyphicon-repeat"></i> Reset</button>
					<br><br><br><br>
				</div>
			</div>
		<hr>
	</div>
	
</article>
		</form>