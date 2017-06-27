<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<form name="frm" method="post">
	<h3>회원가입약관</h3>
	<hr>
	<center>
	<table width="400">
			<tr align="left">
				<td>이용약관</td>
			</tr>
			<tr align="center">
				
				<td><textarea cols="70" rows="5" id="term1" readonly></textarea></td>
			</tr>
			<tr align="right">
				<td>
					
					<input type="checkbox" name="check1">
					<font size="1">이용약관에 동의합니다.</font>
				</td>
			</tr>
			<tr align="left">
				<td>개인정보수집 및 이용안내</td>
			</tr>
			<tr align="center">
				
				<td><textarea cols="70" rows="5" id="term2" readonly></textarea></td>
			</tr>
			<tr align="right">
				<td>
					
					<input type="checkbox" name="check2">
					<font size="1">개인정보 취급 방식에 동의합니다.</font>
				</td>
			</tr>
		</table>
	<br>
	
	<input type="button" value="동의합니다." onclick="confirm()">
	
	<input type="reset" value="동의하지 않습니다." onclick="moveLogin()">
	</center>
</form>


    <!-- jQuery -->
    <script src="/resources/bootstrapPro/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/bootstrapPro/js/bootstrap.min.js"></script>

</body>

</html>
