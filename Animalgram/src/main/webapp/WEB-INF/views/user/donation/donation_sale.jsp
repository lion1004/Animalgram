<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../base/main.jsp"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
    <style type="text/css">
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
      }
     .show{
       position:relative;
       max-width: 1200px; 
       max-height: 800px; 
       overflow: auto;       
     } 
  	
    </style>

<section class="content" style="width:1300px;">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				  <div class="col-lg-12">
                    <h2 class="page-header">나눔 상품정보 </h2>
                  </div>
				<!-- /.box-header -->

<!-- 				<form role="form" action="custom_result" method="post">
 -->				<form role="form" method="post">

					<input type='hidden' name='dno' value="${donationVO.dno}">
				    <input type='hidden' name='page' value="${cri.page}">
					<input	type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				
				
				     <div class="row" style="margin-right: 100px;">

            <div class="col-md-8">
               <img src="${donationVO.dimage }" width="500" height="250">
            </div>

			<label style="font-size: 30px;margin-right: 150px;">${donationVO.dtitle}</label>
			<br>
			<br>
            
            <div>
            	<button class="btn btn-primary" id='saleBtn' style="margin-left: 300px;" id="random"  onclick="chance(${donationVO.dno}">신청하기</button>
            </div>
<%-- onclick="chance(${donationVO.dno}
 --%>        </div>
				
					<div class="form-group">
					<hr>
				
                           <h3 class="page-header">상품 상세정보 </h3>
           
						<textarea class="form-group" name="dinfo" readonly align="center" style="resize: none; width: 1250px; height: 500px" >${donationVO.dinfo}</textarea>
					</div>
	
				</form>



 <div class="box-footer">

   <button type="submit" class="btn btn-primary" id="goListBtn">목록리스트 이동</button>
 </div>



			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->

</section>
<!-- /.content -->

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	

	$("#saleBtn").click(function(no){
		var a = Math.floor(Math.random()*30)+1;
		
		if(a=="1,2,3,4,5,6,7,8,9,10"){			
		formObj.attr("method", "get");
		formObj.attr("action", "/user/donation/donation_result");
		formObj.submit();
		}
		
		alert('<img src=/resources/bootstrapPro/img/custom/목줄.PNG>');
		formObj.attr("method", "get");
		formObj.attr("action", "/user/donation/donation_list");
		formObj.submit();
	});


	$("#goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/user/donation/donation_list");
		formObj.submit();
	});
	 
	<!-- 사용시 -->
	
	
	
});
</script>

