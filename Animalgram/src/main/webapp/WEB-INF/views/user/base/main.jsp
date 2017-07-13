<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>SB Admin - Bootstrap Admin Template</title>
	<!-- jQuery -->
	<script src="/resources/bootstrapPro/js/jquery.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/bootstrapPro/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap Core CSS -->
	<link href="/resources/bootstrapPro/css/bootstrap.min.css"
		rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="/resources/bootstrapPro/css/sb-admin.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link
		href="/resources/bootstrapPro/font-awesome/css/font-awesome.min.css"
		rel="stylesheet" type="text/css">
	
	<style>
	.modal-header, h4, .close {
		background-color: #5cb85c;
		color: white !important;
		text-align: center;
		font-size: 30px;
	}
	
	.modal-footer {
		background-color: #f9f9f9;
	}
	</style>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">AnimalGram</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-fw fa-group"></i> 소모임 <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-fw fa-github-alt"></i> 훈
						련 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-fw fa-comment-o"></i>
						커뮤니티 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-fw fa-search"></i> 안 내 <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
						class="caret"></b></a>
					<ul class="dropdown-menu message-dropdown">
						<li class="message-preview"><a href="#">
								<div class="media">
									<span class="pull-left"> <img class="media-object"
										src="http://placehold.it/50x50" alt="">
									</span>
									<div class="media-body">
										<h5 class="media-heading">
											<strong>John Smith</strong>
										</h5>
										<p class="small text-muted">
											<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
										</p>
										<p>Lorem ipsum dolor sit amet, consectetur...</p>
									</div>
								</div>
						</a></li>
						<li class="message-preview"><a href="#">
								<div class="media">
									<span class="pull-left"> <img class="media-object"
										src="http://placehold.it/50x50" alt="">
									</span>
									<div class="media-body">
										<h5 class="media-heading">
											<strong>John Smith</strong>
										</h5>
										<p class="small text-muted">
											<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
										</p>
										<p>Lorem ipsum dolor sit amet, consectetur...</p>
									</div>
								</div>
						</a></li>
						<li class="message-preview"><a href="#">
								<div class="media">
									<span class="pull-left"> <img class="media-object"
										src="http://placehold.it/50x50" alt="">
									</span>
									<div class="media-body">
										<h5 class="media-heading">
											<strong>John Smith</strong>
										</h5>
										<p class="small text-muted">
											<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
										</p>
										<p>Lorem ipsum dolor sit amet, consectetur...</p>
									</div>
								</div>
						</a></li>
						<li class="message-footer"><a href="#">Read All New
								Messages</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-bell"></i> <b
						class="caret"></b></a>
					<ul class="dropdown-menu alert-dropdown">
						<li><a href="#">Alert Name <span
								class="label label-default">Alert Badge</span></a></li>
						<li><a href="#">Alert Name <span
								class="label label-primary">Alert Badge</span></a></li>
						<li><a href="#">Alert Name <span
								class="label label-success">Alert Badge</span></a></li>
						<li><a href="#">Alert Name <span class="label label-info">Alert
									Badge</span></a></li>
						<li><a href="#">Alert Name <span
								class="label label-warning">Alert Badge</span></a></li>
						<li><a href="#">Alert Name <span
								class="label label-danger">Alert Badge</span></a></li>
						<li class="divider"></li>
						<li><a href="#">View All</a></li>
					</ul></li>
				<c:if test="${user != null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i> ${user } <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/member/mypage"><i class="fa fa-fw fa-user"></i>MyPage</a></li>
							<li class="divider"></li>
							<li><a href="/member/logout"><i class="fa fa-fw fa-power-off"></i>
									LogOut</a></li>
						</ul></li>
				</c:if>
				<c:if test="${user == null }">
					<li id="myBtn"><a> Login </a></li>
				</c:if>





			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<br>
					<li>
                    <div class="col-md-5 col-sm-6 hero-feature" style="margin-left: 0px">
                	<div class="thumbnail" style="width: 200px;height: 100px;margin-top: 10px">
                		<img class="img-responsive img-rounded" src="/resources/image/main/animalgram.png" alt="">
            		</div>
            	   	</div>
               		</li>
					<li><a href="#" data-toggle="collapse" data-target="#group"><i
							class="fa fa-fw fa-group"></i> 소모임 <i
							class="fa fa-fw fa-caret-down"></i></a>
						<ul id="group" class="collapse">
							<li><a href="#">Dropdown Item</a></li>
							<li><a href="#">Dropdown Item</a></li>
						</ul></li>
					<br>
					<li><a href="#" data-toggle="collapse" data-target="#care"><i
							class="fa fa-fw fa-github-alt"></i> 훈 련 <i
							class="fa fa-fw fa-caret-down"></i></a>
						<ul id="care" class="collapse">
							<li><a href="#">Dropdown Item</a></li>
							<li><a href="#">Dropdown Item</a></li>
						</ul></li>
					<br>
					<li><a href="#" data-toggle="collapse" data-target="#cmu"><i
							class="fa fa-fw fa-comment-o"></i> 커뮤니티 <i
							class="fa fa-fw fa-caret-down"></i></a>
						<ul id="cmu" class="collapse">
							<li><a href="#">Dropdown Item</a></li>
							<li><a href="#">Dropdown Item</a></li>
						</ul></li>
					<br>
					<li><a href="#" data-toggle="collapse" data-target="#info"><i
							class="fa fa-fw fa-search"></i> 안내 <i
							class="fa fa-fw fa-caret-down"></i></a>
						<ul id="info" class="collapse">
							<li><a href="#">Dropdown Item</a></li>
							<li><a href="#">Dropdown Item</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<!-- 로그인 모달창 -->
		<%@ include file="../login/login_confirm.jsp" %>

