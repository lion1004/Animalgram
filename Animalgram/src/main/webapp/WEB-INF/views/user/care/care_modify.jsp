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



<style>
#map {
	height: 400px;
	width: 100%;
}
</style>


<script>
	$(function() {
		var date = "${careVO.cdate}".trim();
		var year = parseInt(date.substring(0, date.indexOf("년")));
		var mon = parseInt(date.substring(date.indexOf("년") + 1, date.indexOf("월")));
		var day = parseInt(date.substring(date.indexOf("월") + 1, date.length - 1));
		var setdate = new Date(year, mon - 1, day, 0, 0, 0, 0);

		$("#calendarcare").datepicker({
			minDate : 1,
			maxDate : "1M"
		});
		$("#calendarcare").datepicker("option", "dateFormat", "yy년 mm월 dd일");
		$("#calendarcare").datepicker("option", "showAnim", "show");
		$("#calendarcare").datepicker("setDate", setdate);
	});
</script>


<div id="page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" style="background: #ff8080; margin-top: 10px">
				<h1 class="page-header" style="color: #ffffff">
					훈련일정 수정하기 <small style="color: #222222">・゜゜・**・゜|*╹ω╹*|゜・**・゜゜・*</small>
				</h1>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-lg-6">

				<form action="/care/modify?cno=${careVO.cno}" method="post"
					role="form">

					<div class="form-group">
						<label>훈련 제목</label> <input class="form-control"
							value="${careVO.ctitle} name="">
						<p class="help-block">특정 대상과 반려동물을 비방하는 내용의 글은 작성자 동의없이 삭제 될 수
							있음을 알려드립니다.</p>
					</div>
					<div class="form-group">
						<label>훈련 날짜</label> <input readonly="readonly" name="cdate"
							id="calendarcare" class="form-control">
						<p class="help-block">날짜를 선택해주세요. 당일 훈련은 불가능 합니다.</p>
					</div>

					<div class="form-group">
						<label>참여가능 반려동물</label>
						<select class="form-control" name="">
						<c:set var="type" value="${careVO.ctype}" />
							<option <c:if test="${type eq '강아지' }">selected="selected"</c:if> >강아지</option>
							<option <c:if test="${type eq '고양이' }">selected="selected"</c:if> >고양이</option>
							<option <c:if test="${type eq '기타' }">selected="selected"</c:if> >기타</option>
						</select>
					</div>
					<div class="form-group">
						<label>훈련상태</label> 
						
						<select class="form-control" name="">
						<c:set var="type" value="${careVO.cstate}" />
							<option <c:if test="${type eq '예약' }">selected="selected"</c:if> >예약</option>
							<option <c:if test="${type eq '예약완료' }">selected="selected"</c:if> >예약완료</option>
						</select>
					</div>

					<div class="form-group">
						<label>사진 등록</label> <input type="file">
					</div>

					<div class="form-group">
						<label>훈련 내용</label>
						<textarea class="form-control" rows="3"> ${careVO.ccontent} </textarea>
					</div>
					<div class="form-group">
						<label>훈련 장소</label> <input class="form-control"
							value="경기도 하남시 창우동 245-5 ('사람과 동물' 반려동물 훈련소)" readonly="readonly">
					</div>
					<div id="map"></div>
					<br> <br>
					<button type="submit" class="btn btn-success">훈련 수정</button>
					<button type="reset" class="btn btn-danger"
						onclick="history.back()">훈련 일정으로 가기</button>
				</form>
			</div>
			<!-- /.container-fluid -->

		</div>
	</div>
	<script>
		function initMap() {
			var uluru = {
				lat : 37.538622,
				lng : 127.232862
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 16,
				center : uluru
			});
			var marker = new google.maps.Marker({
				position : uluru,
				map : map
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqEacHVeeyQKNPBk1Aefbsm5vD-cvcnK4&callback=initMap">
    </script>
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
