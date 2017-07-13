<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>
<%@ include file="../login/login_confirm.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	function moveToJoin(){
		location.href="/member/member_join";
	}

	function moveToLogin(){
		$("#myModal").modal();
	}
	
	function moveToPass(){
		location.href="/member/pass";
	}

/* 아이디 찾기 */
	function idfound() {
		var name = document.id_found.mname.value;
		var year = document.id_found.birth1.value;
		var month = document.id_found.birth2.value;
		var day = document.id_found.birth3.value;
		var tel = document.id_found.mtel.value;

		if(name == ""){
			alert('이름을 입력 하세요.')
			document.id_found.mname.focus();
		}else
		if(name.match("[a-zA-Z][0-9]*")){
			alert('이름은 한글만 입력 가능 합니다.')
			document.id_found.mname.focus();
		}else
		if(year == "----"){
			alert("년도를 선택하세요.")
			document.id_found.birth1.focus();
		}else
		if(month == "--"){
			alert("월을 선택하세요.")
			document.id_found.birth2.focus();
		}else
		if(day == "--"){
			alert("일을 선택하세요")
			document.id_found.birth3.focus();
		}else
		if(tel == ""){
			alert("번호를 입력하세요.")
			document.id_found.mtel.focus();
		}else
		if(isNaN(tel)){
			alert("번호는 숫자만 가능 합니다.")
			document.id_found.mtel.focus();
		}else{
		
			
			var birth = year + "/" + month + "/" + day;
		
		$.ajax({
			url : '/member/id',
			type : 'post',
			data : 'mname=' + name + '&birth=' + birth + '&mtel=' + tel,
			success : function(data) {
				
				ht = "";
				
				for(var i = 0; i < data.length; i++){
					ht += "<li>"+data[i] + "</li><br>";
				}
				$('#id_get').html('<br> <font size = 3>아이디 조회 결과 입니다.<br><br> <b> ' + ht + ' </b></font><br><br>'+
					'<input type="button" class="btn btn-warning" value="로그인 하기" onclick="moveToLogin()" style="width: 100px" display: inline;>&nbsp;' +
					'<input type="button" class="btn btn-success" value="비밀번호 찾기" onclick="moveToPass()" style="width: 130px;" display: inline;>')
			
			},
			error : function(result){
				$('#id_get').html('<font size = 3 color = red>존재하지 않은 회원정보 입니다.</font><br><br>'+
						'<input type="button" class="btn btn-warning" value="회원가입 하기" onclick="moveToJoin()" style="width: 120px" display: inline;>');
			}
		});
	}
}
</script>

<title>아이디 찾기</title>

<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h3>
				아이디 찾기 <small>Animalgram</small>
			</h3>
		</div>
		<form class="form-horizontal" name="id_found" id="join_form"
			action="member_login" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">이름</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputName" type="text" name="mname"
						placeholder="이름" maxlength="5" style="width: 200px">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">생년월일</label>
				<div class="col-sm-6">
					<select name="birth1">
						<option value="----">----
							<c:forEach var="i" begin="1960" end="2017" step="1">
								<option value="${i }">
									<c:out value="${i }" />
								</option>
							</c:forEach>
					</select>년 <select name="birth2">
						<option value="--">--
							<c:forEach var="i" begin="1" end="12" step="1">
								<option value="${i }">
									<c:out value="${i }" />
								</option>
							</c:forEach>
					</select>월 <select name="birth3">
						<option value="--">--
							<c:forEach var="i" begin="1" end="31" step="1">
								<option value="${i }">
									<c:out value="${i }" />
								</option>
							</c:forEach>
					</select>일
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="tel" class="form-control" id="inputNumber"
							name="mtel" placeholder="- 없이 입력해 주세요" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="button" id="idbutton"
						onclick="idfound()">
						아이디 찾기<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="button">
						취소<i class="fa fa-times spaceLeft"></i>
					</button>
					<br><br>
					<div class="form-group">
						<b id="id_get" style="color: black; font-size: 8pt;"></b>
					</div>
				</div>
			</div>
		</form>
		<hr>
	</div>

</article>