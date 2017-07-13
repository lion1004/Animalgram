
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
                                                           주문제작 관리
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
						<option value="cuno"
							<c:out value="${cri.searchType eq 'cuno'?'selected':''}"/>>
							제작번호</option>
						<option value="sno"
							<c:out value="${cri.searchType eq 'sno'?'selected':''}"/>>
							판매자번호</option>
						<option value="cutitle"
							<c:out value="${cri.searchType eq 'cutitle'?'selected':''}"/>>
							제목</option>
						<option value="cuprice"
							<c:out value="${cri.searchType eq 'cuprice'?'selected':''}"/>>
							가격</option>
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
                                        <th style="width:120px; text-align:center;">주문제작번호</th>
                                        <th style="width:100px; text-align:center">판매자번호</th>
                                        <th>제목</th>
                                        <th>가격</th>
                                        <th>게시일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                 <c:forEach items="${list }" var="custom">
                                    <tr>
                                        <td align="center">
                                          <input type="checkbox" value="${custom.cuno }">
                                        </td>
                                        <td align="center">${custom.cuno}</td>
                                        <td align="center">
                                          ${custom.sno }
                                        </td>
                                        <td>${custom.cutitle }</td>
                                        <td>${custom.cuprice}</td>
                                        <td>
                                        ${custom.cudate}
                                        </td>
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
									href="cus_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="cus_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="cus_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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
       	  var cuno = $("input[type=checkbox]:checked").val();
       	  location.href 
       	  = '/admin/cus_modify?cuno='+cuno+
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
                  param = "cuno="+$(this).val();
                else param = param + "&cuno="+$(this).val();
              });
                 
              $.ajax({
                url: '/admin/cus_delete',
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

						self.location = "cus_list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select[name=searchType] option:selected").val()
				+"&keyword="+encodeURIComponent($('#keywordInput').val());

					});

     });
     </script>
       </body>
     </html>