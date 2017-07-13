<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
/* 비밀번호 찾기 */
 	
 	function pwdChk(){
 		var pw = document.pass_found.mpass.value;

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

 	function pwC() {
		var pass = document.pass_found.mpass.value;
		var passc = document.pass_found.confirmPwd.value;

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
 	
 	function updatepass(){
 		var idmail = document.pass_found.idmail.value;
 		var pass = document.pass_found.mpass.value;
		var passc = document.pass_found.confirmPwd.value;
		
		if(pass == ""){
			alert("비밀번호를 입력하세요.")
			document.pass_found.mpass.fucous();
		}else
		if(passc == ""){
			alert("비밀번호 확인을 입력하세요.")
			document.pass_found.passc.fucous();
		}else{
 		
 		$.ajax({
 			url : '/passupdate',
 			type : 'post',
 			data : 'mpass=' + pass +'&idmail=' + idmail,
 			success: function(data){
 				alert('비밀번호 변경 완료');
 				location.href = "/member/main";
 			},
 			error: function(data){
 				alert('잘못된 접근입니다.');
 			}
 			
 		});
		}
 	}
 	
 	function join(){
 		location.href = "/member/member_join";
 	}

	function passfound() {
		var idmail = document.pass_found.idmail.value;
		var pwcode = document.pass_found.pwcode.value;
		var pwcodeas = document.pass_found.pwcodeas.value;
		var emailExp = /^[a-zA-Z0-9]{3,15}@[a-zA-Z]+\.[a-zA-Z]+$/g;
		
		if (idmail == "") {
			alert("아이디를 입력해 주세요.");
			document.pass_found.idmail.focus();
		} else if (!emailExp.test(idmail)) {
			alert("이메일 형식으로 입력해 주세요.");
			document.pass_found.idmail.focus();
		} else if (pwcode == "--선택--") {
			alert("보안코드를 선택 해 주세요.")
			document.pass_found.pwcode.focus();
		} else if (pwcodeas == "") {
			alert("보안코드 답변을 입력 해 주세요.")
			document.pass_found.pwcodeas.focus();
		} else
			$.ajax({
				url : '/member/pass',
				type : 'post',
				data : 'pwcode=' + pwcode + '&pwcodeas=' + pwcodeas + '&idmail=' + idmail,
				success : function(data) {

					$('#pass_get').html('<div class="form-group">'+
							'<label class="col-sm-3 control-label" for="idpass">비밀번호</label>'+
							'<div class="col-sm-6">'+
								'<input class="form-control" id="idpass" type="password"'+
									'name="mpass" maxlength="15" placeholder="비밀번호" onkeyup="pwdChk()">'+
								'<p class="help-block">'+
									'<b id="msg" style="color: red; font-size: 8pt;"></b>'+
								'</p>'+
							'</div>'+
						'</div>'+
						'<div class="form-group">'+
							'<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호'+
								'확인</label>'+
							'<div class="col-sm-6">'+
								'<input class="form-control" id="inputPasswordCheck" type="password"'+
									'name="confirmPwd" placeholder="비밀번호 확인" maxlength="15"'+
									'onkeyup="pwC()">'+
								'<p class="help-block">'+
									'<b id="pwCheck" style="color: red; font-size: 8pt;"></b>'+
								'</p>'+
							'</div>'+
						'</div> <input class="btn btn-success"'+
							'type="button" onclick="updatepass()" value="비밀번호 변경">');

				},
				error : function(result) {
					$('.form-group5').html('<font size = 3 color = red>존재하지 않은 회원정보 입니다.</font><br><br>' +
							'<input type="button" class="btn btn-warning" value="아이디 찾기" id="selectid" style="width: 100px" display: inline;>&nbsp;'+	
						'<input type="button" class="btn btn-success" value="회원가입 하기" id="confirm" onclick="join()" style="width: 110px" display: inline;>');
				}
			});
	}
</script>

<title>비밀번호 찾기</title>

<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h3>
				비밀번호 찾기 <small>Animalgram</small>
			</h3>
		</div>
		<form class="form-horizontal" name="pass_found" id="join_form"
			action="member_login" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="idmail">아이디(이메일)</label>
				<div class="col-sm-6">
					<input class="form-control" id="idmail" type="email" name="idmail"
						placeholder="이메일" style="width: 80%; display: inline-block;">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAgree">보안 코드</label>
				<div class="col-sm-6" data-toggle="buttons">
					<select name="pwcode">
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
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="button" id="idbutton"
						onclick="passfound()">
						확인<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="button">
						취소<i class="fa fa-times spaceLeft"></i>
					</button>
					<br>
					<br>
					<div class="form-group5">
						<b id="pass_get" style="color: black; font-size: 8pt;"></b>
					</div>
				</div>
			</div>
		</form>
		<hr>
	</div>

</article>