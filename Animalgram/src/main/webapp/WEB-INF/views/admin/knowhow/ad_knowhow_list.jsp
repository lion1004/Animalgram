<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/navbar.jsp"%>
<div id="wrapper">

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">노하우 게시판 관리 - [1]</h1>

				</div>
			</div>
			<!-- /.row -->

			<div class="row">

				<div class="input-group custom-search-form">
					<input type="text" name="keyword" class="form-control"
						placeholder="Search..." style="width: 160px; float: right;"
						id="keywordInput" value="${cri.keyword }"> <select
						name="searchType" id="searchType" class="form-control"
						style="width: 130px; float: right;">

						<option value=""
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="ntitle"
							<c:out value="${cri.searchType eq ''?'selected':''}"/>>
							제목</option>
						<option value="nickname"
							<c:out value="${cri.searchType eq 'nickname'?'selected':''}"/>>
							작성자 이름</option>
						<option value="antno"
							<c:out value="${cri.searchType eq 'antno'?'selected':''}"/>>
							전체 번호</option>
					</select> <span class="input-group-btn">
						<button id="searchBtn" class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
				<!-- /input-group -->

				<br>
				<br>
				<div class="table-responsive">
					<table id="info" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th style="width: 40px;"></th>
								<th style="width: 100px; text-align: center;">전체번호</th>
								<th style="width: 100px; text-align: center;">게시글번호</th>
								<th>작성자</th>
								<th style="width: 180px;">제목</th>
								<th style="width: 230px">작성일자</th>
								<th>마지막 수정일자</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${list }" var="knowhow">
								<tr>
									<td><input type="checkbox" value="${knowhow.antno }">
									</td>
									<td>${knowhow.antno}</td>
									<td>${knowhow.ntno}</td>
									<td>${knowhow.nickname }</td>
									<td>${knowhow.ntitle }</td>
									<td>${knowhow.ntdate}</td>
									<td>${knowhow.ntupdate}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div style="text-align: right;">
						<a id="delete" class="btn btn-warning">삭제</a>
					</div>
				</div>



				<div class="text-center">
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li><a
								href="knowhow${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="knowhow${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="knowhow${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:if>

					</ul>
				</div>



			</div>
			<!-- /.container-fluid -->
		</div>

	</div>
	<!-- /#page-wrapper -->
</div>


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
    		  
    		  if( confirm("삭제하시겠습니까?") ){
    		  
        	  var param = "";
              $("input[type=checkbox]:checked").each(function() {
                if( param=="" )
                  param = "antno="+$(this).val();
                else param = param + "&antno="+$(this).val();
              });
                 
              $.ajax({
                url: '/admin/board_delete',
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

					self.location = "knowhow"
							+ '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select[name=searchType] option:selected").val()
			+"&keyword="+encodeURIComponent($('#keywordInput').val());

				});
        	 
	 });
        	 
        	 </script>