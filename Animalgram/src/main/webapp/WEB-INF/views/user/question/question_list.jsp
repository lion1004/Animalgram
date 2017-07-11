<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../base/main.jsp"%>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/bootstrapPro/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/bootstrapPro/dist/js/sb-admin-2.js"></script>

<script type="text/javascript">
	//질문 답변 게시판 검색 버튼 유효성 검사
	function question_search_check(){
		if(document.question_search_form.keyword.value == ""){
			alert('내용을 입력하세요.');
			document.question_search_form.ntitle.focus();
		}else{
			document.question_search_form.submit();
		}
	}//question_search_check
	
	$(document).ready(function() {
		
		//질문답변 게시판 리스트 검색 버튼
		$('#searchBtn').click(function(event) {
			self.location = "qlist"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
		
		//질문답변 게시판 리스트 이동 버튼
		$("#listbutton ").click(function() {
			self.location = "qlist"
		});
		
		//질문답변 게시판 글쓰기 버튼
		$('#newBtn').click(function(evt) {
			self.location = "qinsert";
		});
	});//ready
</script>

	<div id= "wrapper">
		<div id="page-wrapper">
			<!-- 게시판 헤더 -->
			<div class="container-fluid">
				<h1 class="page-header">게시판</h1>
			</div>
			<div class="panel panel-default" style="width: 1000px; margin: 0 auto;">
				<div class="panel-heading">
					<h3 class="panel-title">질문답변 게시판</h3>
				</div>
				
				<!-- 검색 기능 -->
				<br>
				<form name="question_search_form">
					<div class='box-body'>
						<select name="searchType" class="form-control" style="width: 100px; display: inline-block;">
							<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>
								---
							</option>
							<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
								제목
							</option>
							<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
								작성자
							</option>
						</select> 
						<input type="text" class="form-control" name='keyword' id="keywordInput" value='${cri.keyword }' style="width: 200px; display: inline-block;">
						<button type="button" class="btn btn-default" id='searchBtn' onclick="question_search_check()"><i class="fa fa-search"></i></button>
					</div>
				</form>
				<br>
				
				<!-- 리스트 페이지 테이블 -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
							<tr>
								<th style="width: 60px">번호</th>
								<th>제목</th>
								<th style="width: 60px">작성자</th>
								<th style="width: 160px">작성일자</th>
								<th style="width: 60px">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="notice">
									<tr>
									<td>${notice.ntno}</td>
									<td><a href='/aboard/qinfo${pageMaker.makeSearch(pageMaker.cri.page)}&nno=${notice.nno}&ntno=${notice.ntno}'>${notice.ntitle}</a></td>
									<td>${notice.nickname}</td>
									<td>${notice.ntdate}</td>
									<td>${notice.ncount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						
					<!-- 글쓰기, 리스트 버튼 -->
					<c:if test="${noticetextVO.nickname == user}">
						<button type="submit" class="btn btn-info" id='listbutton'>리스트</button>
					</c:if>
					<c:if test="${noticetextVO.nickname != user}">
						<button type="submit" class="btn btn-primary" id='newBtn'>글쓰기</button>
						<button type="submit" class="btn btn-info" id='listbutton'>리스트</button>
					</c:if>
				</div>
					
				<!-- 리스트 페이지 번호 -->
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="qlist${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="qlist${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="qlist${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>