<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript">
	var bno = 6;
	$.ajax({
		url : '/replies/all/'+bno,
		success : function(data){
			//alert(data);
			// alert(data.length)
			console.log(data);
			var str ='';
			$(data).each(
				function(){
					str += '<li>'+this.rno+":"+this.replytext+'</li>';
				}		
			); // for
				// url 태그안에 데이터 출력
				$('#replies').html(str);
		} // success
		
	});
</script>
</head>
	<style type="text/css">
		#modDiv{
			background-color: pink;
			width: 300px;
			height: 100px;
			position : absolute;
			left : 50%;
			top: 50%;
			margin-left: -150px;
			margin-top: -50px;
			padding: 10px;
			z-index: 1001;
			}
		#modDiv2{
			background-color: gray;
			width: 300px;
			height: 100px;
			position : absolute;
			left : 40%;
			top: 30%;
			margin-left: -150px;
			margin-top: -50px;
			padding: 10px;
			z-index: 1000;
			}
	</style>
<!-- WEB-INF/views/test.jsp -->
<body>
	<h3>Ajax Test Page</h3>
	<ul id='replies'></ul>
	<div id = "modDiv" style="display: none;">
		안녕하세요옹 :) 모달창!
	</div>
	<div id = "modDiv2">
		<input type="text">
	</div>
</body>
</html>