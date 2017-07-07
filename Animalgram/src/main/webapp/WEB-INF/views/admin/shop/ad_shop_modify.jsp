<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/navbar.jsp" %>

<div id="wrapper">
<!-- Page Content -->
        <div id="page-wrapper">
             <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                                                              샵 번호 ${shop.shno }번의 정보수정
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

			<div class="row">
				<form class="form-horizontal" method="POST">
				  <input type='hidden' name='page' value="${cri.page}"> 
        		  <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	   	 		  <input type='hidden' name='searchType' value="${cri.searchType}">
	    		  <input type='hidden' name='keyword' value="${cri.keyword}">
				
					<div class="form-group">
						<label class="col-sm-2" for="cno">샵 이름 :</label>
						<div class="col-sm-10">
							<p class="form-control-static">${shop.shname }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="cno">샵 종류 :</label>
						<div class="col-sm-10">
							<p class="form-control-static">${shop.shtype }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2" for="shaddr">주소:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Address"
								name="shaddr" style="width: 200px;" maxlength="33"
								value="${shop.shaddr }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="shtel">전화번호:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Tel."
								name="shtel" style="width: 200px;" maxlength="14"
								value="${shop.shtel }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="shtime">운영시간:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Time"
								name="shtime" style="width: 200px;" maxlength="16"
								value="${shop.shtime }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="shsite">좌표:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Site"
								name="shsite" style="width: 200px;" maxlength="30"
								value="${shop.shsite }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="shparking">주차장유무:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Parking"
								name="shparking" style="width: 150px;" maxlength="6"
								value="${shop.shparking }">
						</div>
					</div>
					
					
					<br>
					<br>
					<div class="form-group">
						<div class="col-sm-offset-4">
							<a class="btn btn-default">목록</a>
							<a class="btn btn-primary">수정</a> 
							<a class="btn btn-warning">초기화</a>
						</div>
					</div>
				</form>
			</div>

			<!-- /.container-fluid -->
           </div>
        
        </div>
        <!-- /#page-wrapper -->
        </div>
        <form name="role">
        	
	    </form>
	    
         <script type="text/javascript">
        	  var msg = '${msg}';
        	 if(msg!=null && msg.trim().length > 1){
        		 alert(msg);
        	 } 
        	
        $(document).ready(function(){
        	
        	$(".btn-default") //목록
				.on("click",function() {
					self.location = "/admin/shop_list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});
        	
        	var form = $(".form-horizontal");
        	$(".btn-primary").on("click",function(){ //수정
        	    var shaddr = $("input[name=shaddr]").val();
        	    var shtel = $("input[name=shtel]").val();
        	    var shtime = $("input[name=shtime]").val();
        	    var shsite = $("input[name=shsite]").val();
        	    var shparking = $("input[name=shparking]").val();
        	    
        	    if(shaddr.trim().length==0 || shaddr.trim()==""){
        	    	alert("주소를 입력하세요.");
        	    	return ;
        	    }else if(shtel.trim().length==0 || shtel.trim()==""){
        	    	alert("전화번호를 입력하세요.");
        	    	return ;
        	    }else if(shtime.trim().length==0 || shtime.trim()==""){
        	    	alert("운영시간을 입력하세요.");
        	    	return ;
        	    }else if(shsite.trim().length==0 || shsite.trim()==""){
        	    	alert("좌표를 입력하세요.");
        	    	return ;
        	    }else if(shparking.trim().length==0 || shparking.trim()==""){
        	    	alert("주차장 유무를 입력하세요.");
        	    	return ;
        	    }else{
        		form.submit();
        	    }
        	    	
        	});
        	
        	$(".btn-warning").on("click",function(){
        		location.reload(true);
        	});
        	
        });
          
         </script>
        </body>
        </html>