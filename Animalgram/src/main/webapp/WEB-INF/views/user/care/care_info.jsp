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
						<c:if test="${user != null }">
						<c:set var="state" value="${careVO.cstate}" />		
  						<c:if test="${state eq '예약가능'}">
								<a onclick="openpetlist(${careVO.cno})" class="btn btn-primary">✿훈련신청하기✿</a>
						</c:if>
						
						<c:if test="${state eq '예약완료'}">
								<a onclick="alert('모집이 종료 되었습니다. 다른 훈련을 찾아보세요.')" class="btn btn-primary">✿훈련신청하기✿</a>
						</c:if>
					</c:if>
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
		<div class="modal fade" id="petModal" role="dialog" style="margin-top: 100px">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 펫목록
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" name="pet_list">
							<div class="form-group">				 
								<label><span class="glyphicon glyphicon-user"></span> Pet list</label>
								<br>
								<select id="petlist" style="width: 500px;height:50px ">
 									<c:forEach items="${petlist }" var="animalVO" varStatus="stat">
 										<option value="${animalVO.ano },${animalVO.mno }">[ 펫이름 : ${animalVO.aname } ], [ 펫종류: ${animalVO.atype } ], [ 펫나이: ${animalVO.aage } ]</option>
									</c:forEach>
								</select>
							</div>
							<button type="button" data-dismiss="modal" class="btn btn-success btn-block" id="selectA">
								<span class="glyphicon glyphicon"></span> ✿참가하기✿
							</button>
						</form>
				 </div>
			</div>
		</div>

		<script type="text/javascript">
		
				var cno;
				var ano;
				var mno
				function openpetlist(care){
					cno = care;
					$("#petModal").modal();
				}
				
				$(document).ready(function() {
					
					$("#selectA").click(function(){	
						var number = $('#petlist').val();
						ano = number.substring(0, number.indexOf(','));
						mno = number.substring(number.indexOf(',')+1,number.length);
						$.ajax({
							url : '/care/care_ask',
							type : 'post',
							data : 'cno='+cno+'&ano='+ano+'&mno='+mno,
							success : function(data){
								location.href="/care/cal";
							},
							error : function(data){
								alert("신청 할 수 없는 훈련입니다.");
								
							}
						});
					})
				});
			</script>
