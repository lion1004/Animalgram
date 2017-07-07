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
                                                              훈련번호 ${care.cno }번의 정보수정
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
						<label class="col-sm-2" for="cno">전문가 번호:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${care.pno }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2" for="ctype">훈련종류:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Type"
								name="ctype" style="width: 200px;" maxlength="10"
								value="${care.ctype }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="ccontent">훈련내용:</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="Content.....(500자 제한)"
								name="ccontent" style="height:300px; width:300px;" maxlength="500"
								>${care.ccontent }</textarea>
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
					self.location = "/admin/care_list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});
        	
        	var form = $(".form-horizontal");
        	$(".btn-primary").on("click",function(){ //수정
        		form.submit();
        	});
        	
        	$(".btn-warning").on("click",function(){
        		location.reload(true);
        	});
        	
        });
          
         </script>
        </body>
        </html>