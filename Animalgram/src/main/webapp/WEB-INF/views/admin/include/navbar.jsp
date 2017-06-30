<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrapPro/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/bootstrapPro/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/bootstrapPro/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/bootstrapPro/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- jQuery -->
    <script src="/resources/bootstrapPro/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/bootstrapPro/vendor/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/bootstrapPro/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/bootstrapPro/dist/js/sb-admin-2.js"></script>
    
     <script type="text/javascript">
        $(document).ready(function(){
        	$.ajax({
        		url:'/admin/todayUser',
        		success:function(data){
        			$('#users').html(data);
        		}
        	})
        	
        	$.ajax({
        		url:'/admin/todayBoard',
        		success:function(data){
        			$('#boards').html(data);
        		}
        	})
        });
     </script>
</head>
    <body>
<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main">AnimalGram</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a>
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> 오늘 올라온 게시글
                                   <div style="float:right">
                                    <span id="boards" class="badge"></span>
                                   </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a>
                                <div>
                                    <i class="fa fa-users fa-fw"></i> 신규 가입자
                                   <div style="float:right">
                                    <span id="users" class="badge"></span>
                                   </div>
                                </div>
                            </a>
                        </li>
                        
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="main"><i class="fa fa-user fa-fw"></i>
                        <c:out value="${sessionScope.admin.mname}" /></a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    
                        <li>
                            <a><i class="fa fa-table fa-fw"></i> 회원 관리
                            <span class="fa arrow"></span>
                            </a>
                           <ul class="nav nav-second-level">
                                <li>
                                    <a href="mem_list">이용자 관리</a>
                                </li>
                                <li>
                                    <a href="mem_black">블랙 리스트</a>
                                </li>
                                <li>
                                    <a href="gro_list">소모임 관리</a>
                                </li>
                           </ul>
                        </li>
                        <li>
                            <a><i class="fa fa-table fa-fw"></i> 게시글 관리
                            <span class="fa arrow"></span>
                            </a>
                           <ul class="nav nav-second-level">
                                <li>
                                    <a href="knowhow">노하우 게시판</a>
                                </li>
                                <li>
                                    <a href="question">질문답변 게시판</a>
                                </li>
                           </ul>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <li class="active">
                            <a href="/base/main">
                             <i class="fa fa-files-o fa-fw"></i> AnimalGram Site
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>