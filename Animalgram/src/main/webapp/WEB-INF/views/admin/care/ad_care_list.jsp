
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
                                                           훈련 관리
                        </h1>
                     
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                       
                            <div class="input-group custom-search-form">
                                <input type="text" name="keyword" class="form-control" placeholder="Search..."
                                style="width:160px; float:right;" id="keywordInput" value="${cri.keyword }"> 
                                
                                <select name="searchType" id="searchType"
						class="form-control" style="width: 120px; float: right;">

						<option value=""
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="cno"
							<c:out value="${cri.searchType eq 'cno'?'selected':''}"/>>
							훈련번호</option>
						<option value="pno"
							<c:out value="${cri.searchType eq 'pno'?'selected':''}"/>>
							전문가번호</option>
						<option value="ctype"
							<c:out value="${cri.searchType eq 'ctype'?'selected':''}"/>>
							훈련종류</option>
						<option value="ctitle"
							<c:out value="${cri.searchType eq 'ctitle'?'selected':''}"/>>
							훈련제목</option>
						
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
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th style="width:50px;"></th>
                                        <th style="width:90px; text-align:center;">훈련번호</th>
                                        <th style="width:100px; text-align:center;">전문가번호</th>
                                        <th>훈련종류</th>
                                        <th style="width:300px">훈련제목</th>
                                        <th>훈련상태</th>
                                        <th>훈련날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                 <c:forEach items="${list }" var="care">
                                    <tr>
                                        <td align="center">
                                          <input type="checkbox" value="${care.cno }">
                                        </td>
                                        <td align="center">${care.cno}</td>
                                        <td align="center">
                                          ${care.pno }
                                        </td>
                                        <td>${care.ctype }</td>
                                        <td>${care.ctitle }</td>
                                        <td>${care.cstate}</td>
                                        <td>${care.cdate }</td>
                                    </tr>
                                 </c:forEach>
                               
                                </tbody>
                            </table>
                             <div style="text-align:right;">
                              <a id="update" class="btn btn-info">수정</a>
                              <a id="delete" class="btn btn-warning">삭제</a>
                             </div>
                        </div>
                    
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="care_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="care_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="care_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
            </div>
            <!-- /.container-fluid -->
           </div>
        
        </div>
        <!-- /#page-wrapper -->
        </div>
        
    <div class="modal fade" id="myModal" role="dialog"
     style="margin-top:100px;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
         <div class="modal-body">
			 
		 </div>
		 <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
  			$("#delete").addClass("disabled");
  			$("#update").addClass("disabled");
  			
  			if(checked==0){
    			$("#update").addClass("disabled");
    			$("#delete").addClass("disabled");
    		}else if(checked>1){
    		    $("#update").addClass("disabled");
    		}else if(checked>0){
    			$("#delete").removeClass("disabled");
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
      		}else if(checked>1){
      		    $("#update").addClass("disabled");
      		}else if(checked>0){
      			$("#delete").removeClass("disabled");
      			$("#update").removeClass("disabled");
      		}else if(checked<2){
      		    $("#update").removeClass("disabled");
      	    } 
    		
    	  });
  			
  			
    	  $("#update").on("click",function(){
        	  var cno = $("input[type=checkbox]:checked").val();
        	  location.href 
        	  = '/admin/care_modify?cno='+cno+
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
                  param = "cno="+$(this).val();
                else param = param + "&cno="+$(this).val();
              });
                 
              $.ajax({
                url: '/admin/care_delete',
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
        	 
    	  $('#searchBtn').on(
					"click",
					function(event) {

						self.location = "care_list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select[name=searchType] option:selected").val()
				+"&keyword="+encodeURIComponent($('#keywordInput').val());

					});

     });
     </script>
       </body>
     </html>