
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
                                                           블랙 리스트
                        </h1>
                     
                    </div>
                </div>
                <!-- /.row -->

                <div class="row" style="margin:0px 120px 0px 120px">
                       
                            <div class="input-group custom-search-form">
                                <input type="text" name="keyword" class="form-control" placeholder="Search..."
                                style="width:160px; float:right;" id="keywordInput" value="${cri.keyword }"> 
                                
                                <select name="searchType" id="searchType"
						class="form-control" style="width: 110px; float: right;">

						<option value=""
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="lno"
							<c:out value="${cri.searchType eq 'lno'?'selected':''}"/>>
							식별번호</option>
						<option value="mno"
							<c:out value="${cri.searchType eq 'mno'?'selected':''}"/>>
							회원번호</option>
						<option value="lcause"
							<c:out value="${cri.searchType eq 'lcause'?'selected':''}"/>>
							사유</option>
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
                                        <th></th>
                                        <th style="text-align:center;">식별번호</th>
                                        <th style="text-align:center;">회원번호</th>
                                        <th>제재 사유</th>
                                        <th>등록일자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                 <c:forEach items="${list }" var="black">
                                    <tr>
                                        <td width="30px;" align="center">
                                          <input type="checkbox" value="${black.lno }">
                                        </td>
                                        <td style="width:80px; text-align:center;">
                                         ${black.lno}
                                        </td>
                                        <td style="width:80px; text-align:center;">
                                           ${black.mno}
                                        </td>
                                        <td>
                                        <a data-toggle="modal" data-target="#myModal${black.lno }" style="text-decoration: none;">
                                                                                                       사유 보기
                                        </a>
                                        </td>
                                        <td>
                                        <fmt:formatDate value="${black.ldate}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
                                        </td>
                                    </tr>
                                 </c:forEach>
                               
                                </tbody>
                            </table>
                             <div style="text-align:right;">
                              <a id="delete" class="btn btn-warning">삭제</a>
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
        
        <c:forEach items="${list}" var='black' >
    <div class="modal fade" id="myModal${black.lno }" role="dialog"
     style="margin-top:100px;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">식별번호[${black.lno }] 회원번호[${black.mno }]번의 제재 사유</h4>
        </div>
         <div class="modal-body">
			 ${black.lcause }
		 </div>
		 <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
	   </div> 
      </div>
     </div>
 </c:forEach>
   
   <script type="text/javascript">
    var msg = '${msg}';
	 if(msg!=null && msg.trim().length > 1){
		 alert(msg);
	 } 
	 
     $(document).ready(function(){
    	  var checked = $("input[type=checkbox]:checked").length;
  			$("#delete").addClass("disabled");
  			
  			if(checked==0){
    			$("#delete").addClass("disabled");
    		}else if(checked>0){
    			$("#delete").removeClass("disabled");
    		}
  			//새로고침,뒤로가기로 로딩 되었을 때 
  			
    	  $("input[type=checkbox]").on("click",function(){
    		  checked =  $("input[type=checkbox]:checked").length;
    		  
    		if(checked==0){
    			$("#delete").addClass("disabled");
    		}else if(checked>0){
    			$("#delete").removeClass("disabled");
    		}
    		
    	  });
        
	 
    	  $("#delete").on("click",function(){
    		  
    		  if( confirm("블랙리스트에서 삭제하시겠습니까?") ){
    		  
        	  var param = "";
              $("input[type=checkbox]:checked").each(function() {
                if( param=="" )
                  param = "lno="+$(this).val();
                else param = param + "&lno="+$(this).val();
              });
                 
              $.ajax({
                url: '/admin/mem_black_delete',
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

						self.location = "mem_black"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select[name=searchType] option:selected").val()
				+"&keyword="+encodeURIComponent($('#keywordInput').val());

					});

     });
     </script>
       </body>
     </html>