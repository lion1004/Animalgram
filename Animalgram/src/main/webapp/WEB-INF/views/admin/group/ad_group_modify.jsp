<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/navbar.jsp" %>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
 
 
  	<script>
  		$(function() {
  			$( "#calendar" ).datepicker();
      		$( "#calendar" ).datepicker( "option", "dateFormat", "yy년 mm월 dd일" );
      		$( "#calendar" ).datepicker( "option", "showAnim", "show" );
      		$("#calendar").datepicker( "setDate" , '${group.gdate}' );

     
  		 });
  	</script>
  	
<div id="wrapper">
<!-- Page Content -->
        <div id="page-wrapper">
             <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                                                              소모임번호 ${group.gno }번의 정보수정
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
						<label class="col-sm-2">소모임 제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Title"
								name="gtitle" style="width: 200px;" maxlength="10"
								value="${group.gtitle}">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2">소모임 장소:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Place"
								name="gplace" style="width: 200px;" maxlength="10"
								value="${group.gplace}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="cinfo">제한인원:</label>
						<div class="col-sm-10">
							<select name="glimit" class="form-control" style="width:140px;">
                                    <option value="2" <c:out value="${group.glimit == 2?'selected':''}"/>>--기본--</option>
                                    <option value="3" <c:out value="${group.glimit == 3?'selected':''}"/>>3명</option>
                                    <option value="4" <c:out value="${group.glimit == 4?'selected':''}"/>>4명</option>
                                    <option value="5" <c:out value="${group.glimit == 5?'selected':''}"/>>5명</option>
                                    <option value="6" <c:out value="${group.glimit == 6?'selected':''}"/>>6명</option>
                                    <option value="7" <c:out value="${group.glimit == 7?'selected':''}"/>>7명</option>
                                    <option value="8" <c:out value="${group.glimit == 8?'selected':''}"/>>8명</option>
                                    <option value="9" <c:out value="${group.glimit == 9?'selected':''}"/>>9명</option>
                                    <option value="10" <c:out value="${group.glimit == 10?'selected':''}"/>>10명</option>
                                    <option value="99" <c:out value="${group.glimit == 99?'selected':''}"/>>제한없음</option>
                                </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2">모임 날짜:</label>
						<div class="col-sm-10">
							<div class="form-group">
                                <input name="gdate" id="calendar" class="form-control" style="width:200px;">
                                <p class="help-block">정확한 날짜를 선택해주세요.</p>
                            </div>
						</div>
					</div>
					 <div class="form-group">
                                <label class="col-sm-2">참여 반려동물</label>
                                <div class="col-sm-10">
                                <select name="gtype" class="form-control" style="width:160px;">
                                    <option <c:out value="${group.gtype eq '강아지'?'selected':''}"/>>강아지</option>
                                    <option <c:out value="${group.gtype eq'고양이'?'selected':''}"/>>고양이</option>
                                    <option <c:out value="${group.gtype eq '기타'?'selected':''}"/>>기타</option>
                                </select>
                                </div>
                     </div>
					 <div class="form-group">
                                <label class="col-sm-2">모집상태</label>
                                <div class="col-sm-10">
                                <select name="gstate" class="form-control" style="width:160px;">
                                    <option <c:out value="${group.gstate eq '모집'?'selected':''}"/>>모집</option>
                                    <option <c:out value="${group.gstate eq '중단'?'selected':''}"/>>중단</option>
                                    <option <c:out value="${group.gstate eq '완료'?'selected':''}"/>>완료</option>
                                </select>
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
					self.location = "/admin/gro_list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});
        	
        	var form = $(".form-horizontal");
        	$(".btn-primary").on("click",function(){ //수정
        		var gtitle = $("input[name=gtitle]").val(); 
        	    var gplace = $("input[name=gplace]").val();
        	    var gdate = $("input[name=gdate]").val();
        	    
        	    if(gtitle.trim().length ==0 || gtitle.trim() == ""){
        	    	alert("제목을 입력하세요");
        	    	return ;
        	    }else if(gplace.trim().length ==0 || gplace.trim() == ""){
        	    	alert("장소를 입력하세요");
        	    	return ;
        	    }else if(gdate.trim().length ==0 || gdate.trim() == ""){
        	    	alert("날짜를 입력하세요");
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