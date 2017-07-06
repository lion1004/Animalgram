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
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">고객센터 ${ctno}번 문의</h1>

			<form id="form1" method="post">
					<div class="box box-success">
						<div class="box-header">
							<h3 class="box-title">문의 답변</h3>
						</div>
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">답변 제목</label> <input
									class="form-control" type="text" name="ctrtitle"
									autofocus="autofocus" maxlength="33">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">답변 내용</label>
								<textarea class="form-control" name="ctrcontent" rows="12"
							     maxlength="500"></textarea>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
						<input type='hidden' name='page' value="${cri.page}"> 
					    <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					    <input type='hidden' name='searchType' value="${cri.searchType}">
					    <input type='hidden' name='keyword' value="${cri.keyword}">
						<input type="hidden" name="ctno" value="${ctno }">
							<button type="submit" class="btn btn-primary">답변등록</button>
							<button type="button" class="btn btn-warning" onclick="history.back(-1)">뒤로가기</button>
						</div>

					</div>
						</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->
</div>
<script type="text/javascript">
    var msg = '${msg}';
	 if(msg!=null && msg.trim().length > 1){
		 alert(msg);
	 } 
</script>

</body>
</html>