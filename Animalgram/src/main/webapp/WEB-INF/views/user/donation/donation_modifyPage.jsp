<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../base/main.jsp"%>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">수정 페이지</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="donation_modifyPage" method="post" enctype="multipart/form-data">

	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">나눔번호</label> <input type="text"
								name='dno' class="form-control" value="${donationVO.dno}"
								readonly="readonly">
					
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">상품명</label> <input type="text"
								name='dtitle' class="form-control" value="${donationVO.dtitle}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">상품정보</label>
							<textarea class="form-control" name="dinfo" rows="3">${donationVO.dinfo}</textarea>
						</div>
						
						<div class="form-group">
						<label for="exampleInputPassword1">상품 이미지</label><br>
						<img src="${donationVO.dimage }" style="width: 100px; height: 100px;">
					</div>
					
					 <div class="form-group">
                                <label>변경할 상품 이미지</label>
                                <input type="file" name="file" >
                            </div>

					</div>

	</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>

<script>
$(document).ready(
	function() {
		
		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/user/donation/donation_seller_list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
			var that = $("form[role='form']");
					formObj.submit();
				});
	});
</script>
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

