<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/navbar.jsp"%>

<div id="wrapper">
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">고객센터</h1>
					<!-- /.row -->
					<div class="row" style="margin: 0px 120px 0px 120px">
						<div class="input-group custom-search-form">
							<input type="text" name="keyword" class="form-control" placeholder="Search..." style="width: 160px; float: right;" id="keywordInput" value="${cri.keyword }">
							<select name="searchType" id="searchType" class="form-control" style="width: 120px; float: right;">
								<option value=""<c:out value="${cri.searchType == null?'selected':''}"/>>
									---</option>
								<option value="ctno"<c:out value="${cri.searchType eq 'ctno'?'selected':''}"/>>
									문의번호</option>
								<option value="nickname"<c:out value="${cri.searchType eq 'nickname'?'selected':''}"/>>
									닉네임</option>
								<option value="cttitle"<c:out value="${cri.searchType eq 'cttitle'?'selected':''}"/>>
									문의제목</option>

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
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 90px; text-align: center;">문의번호</th>
										<th style="width: 100px; text-align: center;">고객번호</th>
										<th style="text-align: center">문의제목</th>
										<th style="width: 100px; text-align: center;">문의상태</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${list }" var="center">
										<tr>
											<td align="center">${center.ctno }</td>
											<td align="center">${center.nickname}</td>
											<td><a href="cen_info?ctno=${center.ctno }&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" style="text-decoration: none;">${center.cttitle }</a></td>
											<td align="center">${center.ctstate}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="cen_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="cen_list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="cen_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->
</div>

<div class="modal fade" id="myModal" role="dialog" style="margin-top: 100px;">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var msg = '${msg}';
	if (msg != null && msg.trim().length > 1) {
		alert(msg);
	}

	$(document).ready(function() {

		$('#searchBtn').on(
			"click",
			function(event) {

				self.location = "cen_list"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select[name=searchType] option:selected").val()
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val());

			});

	});
</script>
