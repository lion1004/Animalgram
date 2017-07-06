
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
                                                           소모임 관리
                        </h1>
                     
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                       
                            <div class="input-group custom-search-form">
                                <input type="text" name="keyword" class="form-control" placeholder="Search..."
                                style="width:160px; float:right;" id="keywordInput" value="${cri.keyword }"> 
                                
                                <select name="searchType" id="searchType"
						class="form-control" style="width: 80px; float: right;">

						<option value=""
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="gno"
							<c:out value="${cri.searchType eq 'gno'?'selected':''}"/>>
							번호</option>
						<option value="gtitle"
							<c:out value="${cri.searchType eq 'gtitle'?'selected':''}"/>>
							제목</option>
						<option value="gplace"
							<c:out value="${cri.searchType eq 'gplace'?'selected':''}"/>>
							장소</option>
						<option value="gstate"
							<c:out value="${cri.searchType eq 'gstate'?'selected':''}"/>>
							상태</option>
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
                                        <th style="width:60px; text-align:center;">번호</th>
                                        <th>제목</th>
                                        <th>장소</th>
                                        <th>모임일자</th>
                                        <th>제한인원</th>
                                        <th>상태</th>
                                        <th>작성일자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                 <c:forEach items="${list }" var="group">
                                    <tr>
                                        <td align="center">
                                          <input type="checkbox" value="${group.gno }">
                                        </td>
                                        <td align="center">${group.gno}</td>
                                        <td><a data-toggle="modal" data-target="#myModal${group.gno } }" style="text-decoration:none;">
                                           ${group.gtitle}
                                          </a>
                                        </td>
                                        <td>${group.gplace }</td>
                                        <td>${group.gdate}</td>
                                        <td>
                                        <c:if test="${group.glimit == 99}">
                                                                                                 제한없음
                                        </c:if> 
                                        <c:if test="${group.glimit < 99 }">
                                        ${group.glimit }명
                                        </c:if>
							            </td>
                                        <td>${group.gstate }</td>
                                        <td>
                                        <fmt:formatDate value="${group.gwdate}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
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
									href="gro_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="gro_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="gro_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
            </div>
            <!-- /.container-fluid -->
           </div>
        
        </div>
        <!-- /#page-wrapper -->
        </div>
    	
        
    <div class="modal fade" id="myModal${person.gno }" role="dialog"
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
     	  var gno = $("input[type=checkbox]:checked").val();
     	  location.href 
     	  = '/admin/gro_modify?gno='+gno+
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
                  param = "gno="+$(this).val();
                else param = param + "&gno="+$(this).val();
              });
                 
              $.ajax({
                url: '/admin/gro_delete',
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

						self.location = "gro_list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select[name=searchType] option:selected").val()
				+"&keyword="+encodeURIComponent($('#keywordInput').val());

					});

     });
     </script>
       </body>
     </html>