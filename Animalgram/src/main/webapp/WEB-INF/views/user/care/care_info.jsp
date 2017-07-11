<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">



<style>
#map {
	height: 400px;
	width: 100%;
}
</style>


<div id="page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" style="background: #ff8080; margin-top: 10px">
				<h1 class="page-header" style="color: #ffffff">
					훈련일정 상세정보 <small style="color: #222222">・゜゜・**・゜|*╹ω╹*|゜・**・゜゜・*</small>
				</h1>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-lg-6">

				<form role="form">

					<div class="form-group">
						<label>훈련 제목</label> <input class="form-control"
							value="${careVO.ctitle}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>훈련 날짜</label> <input value="${careVO.cdate}"
							readonly="readonly" id="calendar" class="form-control">
					</div>

					<div class="form-group">
						<label>참여가능 반려동물</label> <input value="${careVO.ctype}"
							readonly="readonly" class="form-control">
					</div>
					<div class="form-group">
						<label>훈련 전문가</label> <input class="form-control"
							value="${memberVO.mname} ( ${professionalVO.ptype} 전문가)"
							readonly="readonly">
						<p class="help-block"></p>
					</div>

					<div class="form-group">
						<label>훈련 내용</label>
						<textarea class="form-control" rows="3" readonly="readonly">
							${careVO.ccontent}
						</textarea>
					</div>
					<div class="form-group">
						<img src="${careVO.cimage}" alt="">
					</div>
					<div class="form-group">
						<label>훈련 장소</label> <input class="form-control"
							value="경기도 하남시 창우동 245-5 ('사람과 동물' 반려동물 훈련소)" readonly="readonly">
					</div>
					<div id="map"></div>
					<br> <br>
					<button type="submit" class="btn btn-success">훈련 신청</button>
					<button type="reset" class="btn btn-danger"
						onclick="history.back()">훈련 일정으로</button>
				</form>
			</div>
			<!-- /.container-fluid -->

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
</div>