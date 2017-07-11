<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- 댓글 목록 -->
	<c:forEach var="row" items="${list}">
		<div class="form-group">
			<label>작성자 : ${row.nickname}</label>&nbsp;&nbsp;&nbsp;
			<small>${row.rdate}</small>&nbsp;&nbsp;&nbsp;
			<c:if test="${row.nickname == user}">
				<input type="button" class="btn btn-xs btn-warning btnModify${row.arno}" value="수정" onclick="showReplyModify('${row.arno}')" style="float: right;">
			</c:if>
		</div>
		<div class="form-group">
			${row.rcontent} <br>
			<!-- 댓글 수정 창 출력 -->
			<div class="updateareply${row.arno}"></div>
			<hr>
		</div>
	</c:forEach>

	<!-- 댓글 페이지 번호 -->
	<div class="form-group" style="text-align: center;">
			<!-- 현재 페이지 블럭이 1보다 크면 처음페이지로 이동 -->
			<c:if test="${replyPager.curBlock > 1}">
				<a href="javascript:listareplyRest('1')">[처음]</a>
			</c:if> 
			
			<!-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 -->
			<c:if test="${replyPager.curBlock > 1}">
				<a href="javascript:listareplyRest('${replyPager.prevPage}')">[이전]</a>
			</c:if> 
			
			<!-- 페이지 블럭 처음부터 마지막 블럭까지 --> 
			<c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
				<c:choose>
					<c:when test="${num == replyPager.curPage}">
						${num}&nbsp;
					</c:when>
				<c:otherwise>
						<a href="javascript:listareplyRest('${num}')">${num}</a>&nbsp;
				</c:otherwise>
				</c:choose>
			</c:forEach> 
			
			<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 -->
			<c:if test="${replyPager.curBlock <= replyPager.totBlock}">
				<a href="javascript:listareplyRest('${replyPager.nextPage}')">[다음]</a>
			</c:if> 
			
			<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
			<c:if test="${replyPager.curBlock <= replyPager.totBlock}">
				<a href="javascript:listareplyRest('${replyPager.totPage}')">[끝]</a>
			</c:if>

	</div>
