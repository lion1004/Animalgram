<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

   <%@include file="../base/main.jsp" %>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">판매자 전용 페이지</h3>
				</div>


				<div class='box-body'>

			<%-- 		<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button> --%>
					<a><button id='newBtn'>상품 등록하기</button></a>
					<a href="/user/custom/seller_list"><button id="sellListBtn">판매자 목록리스트 이동</button></a>
					<a href="/user/custom/custom_list"><button id="goListBtn">고객용 목록리스트 이동</button></a>

				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">주문제작 신청자 리스트</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered" style="border: 1px solid; 
					width:100%; height: 50px; margin: auto; text-align: center;">
						<tr style="height: 30px; margin: auto;">
							<th style="text-align: center; width: 50px;">회원번호</th>
							<th style="text-align: center; width: 60px;">주문서 번호</th>
							<th style="text-align: center; width: 140px;">주문 상품명</th>
							<th style="text-align: center; width: 50px;">상품수량</th>
							<th style="text-align: center; width: 80px;">받는사람</th>
							<th style="text-align: center; width: 220px;">배송주소</th>
							<th style="text-align: center; width: 100px;">전화번호</th>
							<th style="text-align: center; width: 220px;">배송메모</th>
							<th style="text-align: center; width: 80px;">주문일자</th>
						</tr>

						<c:forEach items="${list}" var="billVO" >

							<tr>
								
								<td>${billVO.mno}</td>
								<td>${billVO.bno}</td>
								<td>${billVO.cutitle}</td>
								<td>${billVO.bcount}</td>
								<%-- <td><a
									href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
										${boardVO.title} </a></td> --%>
										
								<td>${billVO.mname}</td>
								<td>${billVO.maddr}</td>
								<td>${billVO.mtel}</td>
								<td>${billVO.bmemo}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${billVO.bdate}" /></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="bill_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="bill_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="bill_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "/user/custom/bill_list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + encodeURIComponent($('#keywordInput').val());

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "/user/custom/custom_confirm";

				});
	

			});
</script>
