<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrapPro/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/bootstrapPro/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/bootstrapPro/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
 
 
  	<script>
  		$(function() {
  			$( "#calendar" ).datepicker();
      		$( "#calendar" ).datepicker( "option", "dateFormat", "yy년 mm월 dd일" );
      		$( "#calendar" ).datepicker( "option", "showAnim", "show" );
  		 });
  	</script>

</head>

<body>



        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           	소모임 수정하기
                        </h1>
              
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form role="form" method="post">

                            <div class="form-group">
                                <label>소모임 제목</label>
                                <input class="form-control">
                                <p class="help-block">특정 대상과 반려동물을 비하하는 내용의 글은 작성자 동의없이 삭제 될 수 있음을 알려드립니다.</p>
                            </div>
                            <div class="form-group">
                                <label>소모임 장소</label>
                                <input class="form-control" placeholder="ex)서울시 금천구 가산디지털 1로  149(신한이노플렉스)">
                            </div>
                      		<div class="form-group">
                                <label>소모임 인원</label>
                                <select class="form-control">
                                    <option value="2">-기본값-</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                    <option value="6">6명</option>
                                    <option value="7">7명</option>
                                    <option value="8">8명</option>
                                    <option value="9">9명</option>
                                    <option value="10">10명</option>
                                    <option value="99">제한없음</option>
                                </select>
                      		</div>
      
                            <div class="form-group">
                                <label>소모임 날짜</label>
                                <input id="calendar" class="form-control">
                                <p class="help-block">정확한 날짜를 선택해주세요.</p>
                            </div>
                            <div class="form-group">
                                <label>참여가능 반려동물</label>
                                <select class="form-control">
                                    <option>강아지</option>
                                    <option>고양이</option>
                                    <option>기타</option>
                                </select>
                      		</div>
                            <div class="form-group">
                                <label>소모임 사진</label>
                                <input type="file">
                            </div>


                            <button type="submit" class="btn btn-primary">✿수정하기✿</button>
                            <button type="reset" class="btn btn-default" onclick="history.back()">✿뒤로가기✿</button>

            </div>
            <!-- /.container-fluid -->


        
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
</body>

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrapPro/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/bootstrapPro/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/bootstrapPro/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>



        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Forms
                        </h1>
              
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form role="form">

                            <div class="form-group">
                                <label>Text Input</label>
                                <input class="form-control">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>

                            <div class="form-group">
                                <label>Text Input with Placeholder</label>
                                <input class="form-control" placeholder="Enter text">
                            </div>

                            <div class="form-group">
                                <label>Static Control</label>
                                <p class="form-control-static">email@example.com</p>
                            </div>

                            <div class="form-group">
                                <label>File input</label>
                                <input type="file">
                            </div>

                            <div class="form-group">
                                <label>Text area</label>
                                <textarea class="form-control" rows="3"></textarea>
                            </div>

                      <div class="form-group">
                                <label>Selects</label>
                                <select class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Multiple Selects</label>
                                <select multiple class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-default">Submit Button</button>
                            <button type="reset" class="btn btn-default">Reset Button</button>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->


    <!-- jQuery -->
    <script src="/resources/bootstrapPro/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/bootstrapPro/js/bootstrap.min.js"></script>

</body>

</html>
