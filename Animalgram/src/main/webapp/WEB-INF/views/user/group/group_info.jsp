<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../base/main.jsp"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<div id="page-wrapper">
	<div class="container">
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12" style="background: #ff8080; margin-top: 10px">
				<h1 class="page-header" style="color: #ffffff">
					소모임 정보보기 <small style="color: #222222">・゜゜・**・゜|*╹ω╹*|゜・**・゜゜・*</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->
		<br> <br>
		<div class="row">
			<div class="col-lg-6">

				<form role="form" method="post">
					<div class="form-group">
						<label>소모임 제목</label> <input class="form-control"
							readonly="readonly" value="${groupVO.gtitle}">
					</div>
					<div class="form-group">
						<label>소모임 장소</label> <input class="form-control"
							readonly="readonly" value="${groupVO.gplace}">
					</div>
					<div class="form-group">
						<label>소모임 인원</label> <input class="form-control"
							readonly="readonly"
							value="${groupVO.gcount}명 / ${groupVO.glimit}명">
					</div>
					<div class="form-group">
						<label>소모임 날짜</label> <input class="form-control"
							readonly="readonly" value="${groupVO.gdate}">
					</div>
					<div class="form-group">
						<label>참여가능 반려동물</label> <input class="form-control"
							readonly="readonly" value="${groupVO.gtype}">
					</div>
					<div class="form-group">
						<img src="${groupVO.gimage}" alt="">
					</div>
					<div class="form-group">
						<label>참여자 정보</label> <select multiple class="form-control">
							  <c:forEach items="${memanilist }" var="animalVO" varStatus="stat">
										<option>(${animalVO.nickname})-${animalVO.aname}:${animalVO.aage},${animalVO.atype}</option>
							  </c:forEach>
						</select>
					</div>
					<c:if test="${user != null }">
						<c:set var="count" value="${groupVO.gcount}" />
						<c:set var="limit" value="${groupVO.glimit}" />		
						<c:if test="${count < limit}">
								<a onclick="openpetlist(${groupVO.gno})" class="btn btn-primary">✿참여하기✿</a>
						</c:if>
						<c:if test="${count == limit}">
								<a onclick="alert('인원이 가득찼습니다. 다른 소모임을 찾아보세요.')" class="btn btn-primary">✿참여하기✿</a>
						</c:if>
					</c:if>
					<a href="/group/list" class="btn btn-danger">✿목록으로 가기✿</a> 
					<%-- <a href="/group/modify?gno=${groupVO.gno}" class="btn btn-warning.disabled">✿수정 하기✿</a>
					 <a href="/group/delete?gno=${groupVO.gno}" class="btn btn-warning.disabled">✿삭제 하기✿</a> --%>
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
							<button type="button" data-dismiss="modal" class="btn btn-success btn-block" id="selectB">
								<span class="glyphicon glyphicon"></span> ✿참가하기✿
							</button>
						</form>
				 </div>
			</div>
		</div>

		<script type="text/javascript">
		
				var gno;
				var ano;
				var mno
				function openpetlist(group){
					gno = group;
					$("#petModal").modal();
				}
				
				$(document).ready(function() {
					
					$("#selectB").click(function(){	
						var number = $('#petlist').val();
						ano = number.substring(0, number.indexOf(','));
						mno = number.substring(number.indexOf(',')+1,number.length);
						$.ajax({
							url : '/group/group_join',
							type : 'post',
							data : 'gno='+gno+'&ano='+ano+'&mno='+mno,
							success : function(data){
								location.href="/group/list";
							},
							error : function(data){
								alert("동일 반려동물 과 이미 참여한 소모임입니다.");
								
							}
						});
					})
				});
			</script>
