<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../base/main.jsp"%>
<%-- <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</script>
<script type="text/javascript">
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
				document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('sample6_address').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('sample6_address2').focus();
			}
		}).open();
	}

	function check() {
		if (document.join_form.idmail.value == "") {
			alert("아이디를 입력하세요.");
			document.join_form.idmail.focus();
		} else if (document.join_form.mpass.value == "") {
			alert("비밀번호를 입력하세요.");
			document.join_form.mpass.focus();
		} else if (document.join_form.confirmPwd.value == "") {
			alert("비밀번호 확인을 입력하세요.");
			document.join_form.confirmPwd.focus();

		} else if (document.join_form.mname.value == "") {
			alert("이름을 입력하세요.");
			document.join_form.mname.focus();
		} else if (document.join_form.mname.value.match("[a-zA-Z][0-9]*")){
			alert("이름은 한글만 입력 가능 합니다.")
			document.join_form.mname.focus();
		} else if (document.join_form.nickname.value.match("[a-zA-Z][0-9]*")){
			alert("닉네임은 한글만 입력 가능 합니다.")
			document.join_form.nickname.focus();
		} else if (document.join_form.addrno.value == "") {
			alert("우편번호를 입력하세요.");
			document.join_form.addrno.focus();
		} else if (document.join_form.addr1.value == "") {
			alert("주소를 입력하세요.");
			document.join_form.addr1.focus();

		} else if (document.join_form.addr2.value == "") {
			alert("상세 주소를 입력하세요.");
			document.join_form.addr2.focus();
		} else if (document.join_form.mtel.value == "") {
			alert("연락처를 입력하세요.");
			document.join_form.mtel.focus();
		} else if (isNaN(document.join_form.mtel.value)) {
			alert("연락처는 숫자만 입력 가능합니다.")
			document.join_form.mtel.focus();
		} else if (document.join_form.pwcode.value == "--선택--"){
			alert("보안코드를 선택 해 주세요.")
			document.join_form.pwcode.focus();
		} else if(document.join_form.pwcodeas.value == ""){
			alert("보안코드 답변을 입력 해 주세요.")
			document.join_form.pwcodeas.focus();
		} else
			document.join_form.submit();
	}

	function pwC() {
		var pass = document.join_form.mpass.value;
		var passc = document.join_form.confirmPwd.value;

		if (pass != passc) {
			document.getElementById("pwCheck").innerHTML = "비밀번호가 일치하지 않습니다.";
			$("#pwCheck").css("color", "red");
			return false;
		}
		if (pass == passc) {
			document.getElementById("pwCheck").innerHTML = "비밀번호가 일치합니다.";
			$("#pwCheck").css("color", "black");
		}
	}

	function pwdChk() {
		var pw = document.join_form.mpass.value;

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
		/* alert(regArr[0] + "/"+ regArr[1] +"/"+ regArr[2]); */


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
	/* 닉네임 중복 체크 */
	function nickcheck(){
		
		var nickname = document.join_form.nickname.value;
		
		$.ajax({
			url:'/nickcheck?nickname='+nickname,
			success:function(data){
				if(data == 'possible'){
					$("#nickCheck").html('사용가능 합니다.')
					$("#nickCheck").css("color","red");
				} else
					$("#nickCheck").html('이미 사용 중 입니다.')
					$("#nickCheck").css("color","red");
			}
		});
		
	}
	
	function openIdChk() {
		window.name = "parentForm";
		window.open("idcheck", "chkForm",
			"width=500, height=300, resizable=no, scrollbars=no");
	}

	function main() {
		alert("메인페이지로 이동합니다.");
		location.href = "/Choongang_test/main.jsp";
	}
	
	/* Modal 창 열기 */
	
	<!-- 로그인창 오픈 -->
	$(document).ready(function() {
			$("#modal").click(function() {
			$("#checkM").modal();
		});
	});
	
</script>
<title>회원가입 폼</title>

<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h3>
				회원가입 <small>Animalgram</small>
			</h3>
		</div>
		<form class="form-horizontal" name="join_form" id="join_form"
			action="member_join" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="idmail">아이디(이메일)</label>
				<div class="col-sm-6">
					<input class="form-control" id="idmail" type="email" name="idmail"
						readonly="readonly" placeholder="이메일" onclick="openIdChk()"
						style="width: 80%; display: inline-block;"> <input
						type="button" class="btn btn-warning" name="chbutton" value="중복확인"
						onclick="openIdChk()">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="idpass">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="idpass" type="password"
						name="mpass" maxlength="15" placeholder="비밀번호" onkeyup="pwdChk()">
					<p class="help-block">
						<b id="msg" style="color: red; font-size: 8pt;"></b>
					</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPasswordCheck" type="password"
						name="confirmPwd" placeholder="비밀번호 확인" maxlength="15"
						onkeyup="pwC()">
					<p class="help-block">
						<b id="pwCheck" style="color: red; font-size: 8pt;"></b>
					</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">이름</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputName" type="text" name="mname"
						placeholder="이름" maxlength="5" style="width: 200px">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">성별</label>
				<div class="col-sm-6">
					<input type="radio" name="mgender" value="남" checked="checked"><label
						class="radio-inline">남</label> <input type="radio" name="mgender"
						value="여"><label class="radio-inline">여</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">닉네임</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputName" type="text" onkeyup="nickcheck()"
						name="nickname" placeholder="5글자 이내" maxlength="5" style="width: 50%; display: inline-block;">
					<b id="nickCheck" style="color: red; font-size: 8pt;"></b>
					
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">생년월일</label>
				<div class="col-sm-6">
					<select name="birth1">
						<option value="">----
							<c:forEach var="i" begin="1920" end="2017" step="1">
								<option value="${i }">
									<c:out value="${i }" />
								</option>
							</c:forEach>
					</select>년 <select name="birth2">
						<option value="">--
							<c:forEach var="i" begin="1" end="12" step="1">
								<option value="${i }">
									<c:out value="${i }" />
								</option>
							</c:forEach>
					</select>월 <select name="birth3">
						<option value="">--
							<c:forEach var="i" begin="1" end="31" step="1">
								<option value="${i }">
									<c:out value="${i }" />
								</option>
							</c:forEach>
					</select>일
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">주소</label>
				<div class="col-sm-6">
					<input type="text" name="addrno" id="sample6_postcode"
						placeholder="우편번호"> <input class="btn btn-success"
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName"></label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="addr1"
						id="sample6_address" placeholder="주소" st><br> <input
						type="text" class="form-control" name="addr2"
						id="sample6_address2" placeholder="상세주소">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="tel" class="form-control" id="inputNumber" name="mtel"
							placeholder="- 없이 입력해 주세요" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">관심분야</label>
				<div class="col-sm-6">
					<div class="col-sm-6">
						<input type="radio" name="favorite" value="dog" checked="checked">강아지<input
							type="radio" name="favorite" value="cat">고양이 <input
							type="radio" name="favorite" value="etc"><label
							class="radio-inline">기타</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAgree">보안 코드</label>
				<div class="col-sm-6" data-toggle="buttons">
					<select name = "pwcode">
								<option>--선택--</option>
								<option>나의 고향은?</option>
								<option>나의 별명은?</option>
								<option>학창시절 기억에 남는 선생님 성함은?</option>
								<option>가장 기억에 남는 장소는?</option>
						</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="anser">보안 코드 답변</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="tel" class="form-control" id="anser" name="pwcodeas"
							placeholder="답변을 입력 해 주세요." />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
				<div class="col-sm-6" data-toggle="buttons">
					<label class="btn btn-warning"> <input id="agree"
						type="checkbox" autocomplete="off"> <span
						class="fa fa-check"></span>
					</label> <a id="modal">이용약관</a> 에 동의 합니다.
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="button" onclick="check()">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="submit">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
		<hr>
	</div>
	<%@ include file="confirm.jsp" %>
</article>
