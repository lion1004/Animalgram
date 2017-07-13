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

    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
     <img id="popup_img">
    </div>

<section class="content" style="width:1300px;">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				  <div class="col-lg-12">
                    <h2 class="page-header">주문제작 상품정보 </h2>
                  </div>
				<!-- /.box-header -->

<!-- 				<form role="form" action="custom_result" method="post">
 -->				<form role="form" method="post">

					<input type='hidden' name='cuno' value="${customVO.cuno}">
				    <input type='hidden' name='page' value="${cri.page}">
					<input	type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				
				
				     <div class="row" style="margin-right: 100px;">

            <div class="col-md-8">
               <img src="/displayFile?fileName=${customVO.fullName }" width="500" height="250">
            </div>

			<label style="font-size: 40px;margin-right: 0px; ">상품명 : ${customVO.cutitle}</label>
			<label style="font-size: 20px;margin-right: 50px; ">상품가격 : ${customVO.cuprice} 원</label>
			<br>
			<br>
            <p class="col-md-4">
               <label>제작 물품 수량</label>
                   <select class="form-control" id="bcount" name="bcount">
                       <option value="choice">============선택===========</option>
                       <option value="1">1</option>
                       <option value="2">2</option>
                       <option value="3">3</option>
                 
                    </select>
            </p>
            
            <div>
            	<button class="btn btn-primary" id='saleBtn' style="margin-left: 300px;">신청하기</button>
            </div>

        </div>
				
					<div class="form-group">
					<hr>
				
                           <h3 class="page-header">상품 상세정보 </h3>
           
						<textarea class="form-group" name="cuinfo" readonly align="center" style="resize: none; width: 1250px; height: 500px" >${customVO.cuinfo}</textarea>
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


<script id="templateAttach" type="text/x-handlebars-template">

<img src="{{imgsrc}}" alt="Attachment" style="width: 500px; height: 200px;">
           
</script>  



<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>			
</li>
{{/each}}
</script>

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
	
	$("#saleBtn").click(function(){
		if($("#bcount option:checked").val()=="choice"){
			alert("수량을 선택하십시오.");
			return false;
		}
		formObj.attr("method", "get");
		formObj.attr("action", "/user/custom/custom_result");
		formObj.submit();
	});


	$("#goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/user/custom/custom_list");
		formObj.submit();
	});
	
	var cuno = ${customVO.cuno};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/user/custom/getAttach/"+cuno,function(list){
		$(list).each(function(){
		
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
// 			alert('getattach조회확인');
		});
	});

	
});
</script>

