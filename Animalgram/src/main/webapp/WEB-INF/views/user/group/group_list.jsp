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
		<div class="row">
			<div class="col-lg-12" style="background: #ff8080; margin-top: 10px;">
				<h1 class="page-header" style="color: #ffffff">
					함께하는 소모임 <small style="color: #222222">・゜゜・**・゜|*╹ω╹*|゜・**・゜゜・*</small>
				</h1>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<!-- Jumbotron Header -->
		<div class="row">
			<div class="col-md-7">
				<img class="img-responsive img-rounded"
					src="/resources/image/group/petjoin.jpg" alt="">
			</div>
			<!-- /.col-md-8 -->
			<div class="col-md-5">

				<h1>(⋈◍＞◡＜◍)。✧♡</h1>
				<h1>함께해요。</h1>
				<p>당신의 소중한 반려동물을 외롭지 않게 해주세요。</p>
				<p>･ﾟﾟ･*:.｡..｡.:*ﾟ:*:✼✿(ღ✪ｖ✪)｡ﾟ:*:✼.｡✿.｡</p>
				<a class="btn btn-warning btn-lg" href="/group/confirm">✿소모임 개설
					하기✿</a>
			</div>
			<!-- /.col-md-4 -->
		</div>

		<hr>

		<!-- Title -->
		<div class="row">
			<div class="col-lg-12">
				<h3>소모임 목록 +。:.ﾟ(๑＞◡╹๑)〜♥</h3>
			</div>
		</div>
		<!-- /.row -->
		<hr>
		<!-- Page Features -->
		<div class="row text-center">
			<c:forEach items="${grouplist }" var="groupVO" varStatus="stat">
				<div class="col-md-3 col-sm-6 hero-feature">
					<div class="thumbnail">
						<img src="${groupVO.gimage}" alt="">
						<div class="caption">
							<h3>${groupVO.gtitle}</h3>
							<hr>
							<p align="left">참가 동물 : ${groupVO.gtype}</p>
							<p align="left">참가 인원 : ${groupVO.gcount} /
								${groupVO.glimit}명</p>
							<p align="left">모임 날짜 : ${groupVO.gdate}</p>
							<p align="left">모집 상태 : ${groupVO.gstate}</p>
							<hr>
							<p>
								<a href="/group/" class="btn btn-primary">✿참여하기✿</a> <a
									href="/group/info?gno=${groupVO.gno}" class="btn btn-success">✿상세정보✿</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<hr>
		<!-- /.row -->

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
<!-- /.container -->


