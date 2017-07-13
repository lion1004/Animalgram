<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/navbar.jsp"%>
<style type="text/css">
 textarea { resize: none; }
</style>
<div id="wrapper">
<!-- Page Content -->
        <div id="page-wrapper">
             <div class="container-fluid" style="margin-bottom:80px;">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                                                                문의${reply.ctno }번의 답변 수정
                        </h1>
                   
                

				<form id="form1" method="post">
                    <input type='hidden' name='ctrno' value="${reply.ctrno}">
					<input type='hidden' name='ctno' value="${reply.ctno}"> 
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> 
						<input type="text" name="ctrtitle" class="form-control"
							value="${reply.ctrtitle}" maxlength="33">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">내용</label> 
						<textarea name="ctrcontent" class="form-control" maxlength="500"
						rows="12">${reply.ctrcontent}</textarea>
					</div>
					
				</div>
				<!-- /.box-body -->

			  <div class="box-footer">
			    <button type="button" class="btn btn-info" onclick="history.back(-1)">뒤로가기</button>
			    <button type="button" class="btn btn-primary">수정</button>
		     </div>
			</form>
		   </div>
		
		</div>
	
		
			</div>
			
		 </div>
		   
	 </div>
	<!-- wrapper -->
<script type="text/javascript">
var msg = '${msg}';
if(msg!=null && msg.trim().length > 1){
	 alert(msg);
} 

 $(document).ready(function(){
	 
	 $(".btn-primary").on("click",function(){
	 var ctrtitle = $("input[name=ctrtitle]").val();
	 var ctrcontent = $("textarea[name=ctrcontent]").val();
		if(ctrtitle.trim().length == 0 || ctrtitle.trim() ==""){
			alert("빈 값이 있어선 안됩니다.");
		}else if(ctrcontent.trim().length == 0 || ctrcontent.trim() ==""){
			alert("빈 값이 있어선 안됩니다.");
		}else{
			var form = $("#form1");
			form.submit();
		}
	 });
 });
</script>
	</body>
</html>
		  