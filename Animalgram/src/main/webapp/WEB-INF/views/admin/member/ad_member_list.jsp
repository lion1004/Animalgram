<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/navbar.jsp" %>
<style type="text/css">
 
 .slash {
	background:url(http://cdn.zetawiki.com/png/slash.png);
	background-size:100% 100%;
	border:1px solid gray;
	padding: 5px;
}

</style>
<div id="wrapper">
        
        <!-- Page Content -->
        <div id="page-wrapper">
             <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                                                           이용자 관리
                        </h1>
                     
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                       
                            <div class="input-group custom-search-form">
                                <input type="text" name="keyword" class="form-control" placeholder="Search..."
                                style="width:160px; float:right;" id="keywordInput" value="${cri.keyword }"> 
                                
                                <select name="searchType" id="searchType"
						class="form-control" style="width: 110px; float: right;">

						<option value=""
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="mno"
							<c:out value="${cri.searchType eq 'mno'?'selected':''}"/>>
							번호</option>
						<option value="mname"
							<c:out value="${cri.searchType eq 'mname'?'selected':''}"/>>
							이름</option>
						<option value="idmail"
							<c:out value="${cri.searchType eq 'idmail'?'selected':''}"/>>
							이메일</option>
						<option value="job"
							<c:out value="${cri.searchType eq 'job'?'selected':''}"/>>
							등급</option>
					</select> 
					        <span class="input-group-btn">
                                    <button id="searchBtn" class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
   
                        <br><br>
                        <div class="table-responsive">
                            <table id="info" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>비밀번호</th>
                                        <th>가입일자</th>
                                        <th>등급</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                 <c:forEach items="${list }" var="amember">
                                    <tr>
                                        <td width="30px;" align="center">
                                          <input type="checkbox" value="${amember.mno }">
                                        </td>
                                        <td style="width:50px; text-align:center;">${amember.mno}</td>
                                        <td>
                                          <a data-toggle="modal" data-target="#myModal${amember.mno }" style="text-decoration:none;">
                                           ${amember.mname}
                                          </a>
                                        </td>
                                        <td>${amember.idmail}</td>
                                        <td>${amember.mpass}</td>
                                        <td><fmt:formatDate value="${amember.mdate}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
                                        </td>
                                        <td <c:out value="${amember.listCheck == 'true'?'class=slash':''}"/>>${amember.job }</td>
                                    </tr>
                                 </c:forEach>
                               
                                </tbody>
                            </table>
                             <div style="text-align:right;">
                              <a id="update" class="btn btn-info">수정</a>
                              <a id="delete" class="btn btn-warning">삭제</a>
                              <a id="black" class="btn btn-danger">블랙리스트</a>
                             </div>
                        </div>
                   
           
                    
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="mem_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="mem_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="mem_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				
				
			</div>
            <!-- /.container-fluid -->
           </div>
        
        </div>
        <!-- /#page-wrapper -->
        </div>
   
   <c:forEach items="${list}" var='amember' >
    <div class="modal fade" id="myModal${amember.mno }" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${amember.mno }번 [${amember.mname }]회원의 정보</h4>
        </div>
         <div class="modal-body">
		  <table class="table table-bordered table-hover">
		   <tbody>
			 <tr>
		       <td>아이디</td>
		   	   <td id="td1">${amember.idmail }</td>
		   	 </tr>
			 <tr>
		       <td>비밀번호</td>
		   	   <td id="td2">${amember.mpass }</td>
		   	 </tr>
			 <tr>
		       <td>비밀번호힌트</td>
		   	   <td id="td11">${amember.mhint }</td>
		   	 </tr>
			 <tr>
		       <td>닉네임</td>
		   	   <td id="td3">${amember.nickname }</td>
		   	 </tr>
			 <tr>
		       <td>생년월일</td>
		   	   <td id="td4">${amember.birth }</td>
		   	 </tr>
			 <tr>
		       <td>성별</td>
		   	   <td id="td5">${amember.mgender }</td>
		   	 </tr>
			 <tr>
		       <td>직업</td>
		   	   <td id="td6">${amember.job }</td>
		   	 </tr>
			 <tr>
		       <td>전화번호</td>
		   	   <td id="td7">${amember.mtel }</td>
		   	 </tr>
			 <tr>
		       <td>주소</td>
		   	   <td id="td8">${amember.maddr }</td>
		   	 </tr>
			 <tr>
		       <td>관심분야</td>
		   	   <td id="td9">${amember.favorite }</td>
		   	 </tr>
			 <tr>
		       <td>가입일자</td>
		   	   <td id="td10">
		   	     <fmt:formatDate value="${amember.mdate}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
		   	   </td>
		   	 </tr>
		<tbody>
		   </table>
		   <div style="text-align:right">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
           </div>
	     </div> 
	     <!-- modal body -->
      </div>
     </div>
  </div>
 </c:forEach>
 
              <div class="modal fade" id="blackModal" role="dialog"
					style="margin-top:100px">
					<div class="modal-dialog modal-sm">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" align="center">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">사유</h4>
							</div>
							<div class="modal-body">
							  <div align="center">
							   <textarea name="lcause" id="lcause" maxlength="33"
							    style="width:200px; height:120px; resize:none"></textarea>
							  </div>
							</div>
							<div class="modal-footer">
							    <button id="add" type="button" class="btn btn-primary"
							    >추가</button>
							    
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

    <script type="text/javascript">
    var msg = '${msg}';
	 if(msg!=null && msg.trim().length > 1){
		 alert(msg);
	 } 
	 
     $(document).ready(function(){
    	  var checked = $("input[type=checkbox]:checked").length;

  			$("#update").addClass("disabled");
  			$("#delete").addClass("disabled");
  			$("#black").addClass("disabled");
  			
  			if(checked==0){
    			$("#update").addClass("disabled");
    			$("#delete").addClass("disabled");
    			$("#black").addClass("disabled");
    		}else if(checked>1){
    		    $("#update").addClass("disabled");
    		}else if(checked>0){
    			$("#delete").removeClass("disabled");
    			$("#black").removeClass("disabled");
    			$("#update").removeClass("disabled");
    		}else if(checked<2){
    		    $("#update").removeClass("disabled");
    	    } 
  			//새로고침,뒤로가기로 로딩 되었을 때 
  			
  			
    	  $("input[type=checkbox]").on("click",function(){
    		  checked =  $("input[type=checkbox]:checked").length;
    		  
    		if(checked==0){
    			$("#update").addClass("disabled");
    			$("#delete").addClass("disabled");
    			$("#black").addClass("disabled");
    		}else if(checked>1){
    		    $("#update").addClass("disabled");
    		}else if(checked>0){
    			$("#delete").removeClass("disabled");
    			$("#black").removeClass("disabled");
    			$("#update").removeClass("disabled");
    		}else if(checked<2){
    		    $("#update").removeClass("disabled");
    	    } 
    		
    	  });
  			
          $("#update").on("click",function(){
        	  var mno = $("input[type=checkbox]:checked").val();
        	  location.href 
        	  = '/admin/mem_modify?mno='+mno+
        			 '&page=${cri.page}'+
        			 '&perPageNum=${cri.perPageNum}'+
        			 '&searchType=${cri.searchType}'+
        			 '&keyword=${cri.keyword}';
        	 }); //update
  			
    	  $("#delete").on("click",function(){
    		  
    		  if( confirm("삭제하시겠습니까?") ){
    		  
        	  var param = "";
              $("input[type=checkbox]:checked").each(function() {
                if( param=="" )
                  param = "mno="+$(this).val();
                else param = param + "&mno="+$(this).val();
              });
                 
              $.ajax({
                url: '/admin/mem_delete',
                type: 'post',
                data: param,
                success : function(data) {
                  location.reload(true);
                  alert(data);
                },
                error : function() { console.log('error');
                }
              }); //ajax
    		  }
        	 }); //delete
         
        $("#black").on("click",function(){
        		$("#lcause").val("");
        	if(confirm("블랙리스트에 추가하시겠습니까?")){
        		
        		$("#blackModal").modal('show');
        		
        		$("#add").on("click",function(){
        		var param = "";
                $("input[type=checkbox]:checked").each(function() {
                  if( param=="" )
                    param = "mno="+$(this).val()+"&lcause="+$("#lcause").val();
                  else param = param + "&mno="+$(this).val();
                });
                   
                $.ajax({
                  url: '/admin/mem_addBlack',
                  type: 'post',
                  data: param,
                  success : function(data) {
                	  location.reload();
                    alert(data);
                  }
                
                  });//ajax
                }); //add
        		
        		}; //confirm
      		  
          	 }); //blacklist
        	 
    	  $('#searchBtn').on(
					"click",
					function(event) {

						self.location = "mem_list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select[name=searchType] option:selected").val()
				+"&keyword="+encodeURIComponent($('#keywordInput').val());

					});

     });
     
    </script>

</body>

</html>
