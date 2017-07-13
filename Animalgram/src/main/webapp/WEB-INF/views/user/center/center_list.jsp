<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/bootstrapPro/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/bootstrapPro/dist/js/sb-admin-2.js"></script>
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
								<th>내용</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${center}" var="list">
								<tr>
									<td>${list.ctno}</td>
									<td><a href='/center/cinfo${center_maker.makeQuery(center_maker.cri.page)}&ctno=${list.ctno}'>${list.cttitle}</a></td>
									<td>${list.ctcontent }</td>
									<td>${list.ctstate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!-- 리스트 페이지 번호 -->
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${center_maker.prev}">
								<li><a href="clist${center_maker.makeQuery(center_maker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${center_maker.startPage }" end="${center_maker.endPage }" var="idx">
								<li 
								<c:out value="${select9 == idx?'class =active':''}"/>>
									<a href="clist${center_maker.makeQuery(idx)}&tab=center_list">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${center_maker.next && center_maker.endPage > 0}">
								<li><a href="clist${center_maker.makeQuery(center_maker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>