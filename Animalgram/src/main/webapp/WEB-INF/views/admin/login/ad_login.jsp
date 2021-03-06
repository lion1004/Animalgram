<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 로그인창</title>

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

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">관리자 로그인</h3>
                    </div>
                    <div class="panel-body">
                    
                        <form role="form" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" maxlength="30" placeholder="Email" name="idmail" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" maxlength="30" placeholder="Password" name="mpass" type="password">
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <button class="btn btn-lg btn-success btn-block">로그인</button><br>
                     
                            </fieldset>
                        </form>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

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
    	 var msg = '${msg}';
    	 if(msg=='로그인 실패'||msg=='로그인을 해야합니다'){
    	    alert(msg);
    	 }
    });
    </script>
   
</body>

</html>
