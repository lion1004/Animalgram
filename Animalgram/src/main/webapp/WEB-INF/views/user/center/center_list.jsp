<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../base/main.jsp"%>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/bootstrapPro/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/bootstrapPro/dist/js/sb-admin-2.js"></script>
	<div id= "wrapper">
		<div id="page-wrapper">
			<!-- 게시판 헤더 -->
			<div class="container-fluid">
				<h1 class="page-header">1:1문의</h1>
			</div>
			<div class="panel panel-default" style="width: 600px; margin: 0 auto;">
				<div class="panel-heading">
					<h3 class="panel-title">1:1문의</h3>
				</div>
				
				<!-- 검색 기능 -->
				<br>
				
				<br>
				
				<!-- 리스트 페이지 테이블 -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th style="width: 60px">번호</th>
								<th>제목</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="center">
								<tr>
									<td>${center.ctno}</td>
									<td><a href='/center/cinfo${pageMaker.makeQuery(pageMaker.cri.page)}&ctno=${center.ctno}'>${center.cttitle}</a></td>
									<td>${center.ctstate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!-- 리스트 페이지 번호 -->
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="clist${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="clist${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="clist${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>