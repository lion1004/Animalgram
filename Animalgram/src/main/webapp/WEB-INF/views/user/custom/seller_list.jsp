<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../base/main.jsp"%>

<!-- Main content -->
<style>
.cuinfo{
    white-space: nowrap; 
    width: 30em; 
    overflow: hidden;
    text-overflow: ellipsis; 
    margin-top: 40px;
}

table, td,th{
border: 1px solid;
}
table{
width: 60%;
height: 100px;
margin: auto;
text-align: center;
}
</style>

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

					<a href="/user/custom/bill_list" ><button id='newBtn'>고객 주문목록 이동</button></a>
					
				</div> 
			</div>
			
				
	<!-- --------------------------------------------------------------------------------------- -->			
	
		 <!-- Page Content -->
    <div class="container">
	<br>
	
    <!-- /.container -->
    
    <div class="box">
					<div class="box-header with-border">
					<h3 class="box-title">상품 등록 리스트</h3>
				</div>
					<div class="box-body">
					<table class="table table-bordered" >
						<tr >
							<th style="width: 120px; text-align: center">주문제작 번호</th>
							<th style="text-align: center">상품 이미지</th>
							<th style="text-align: center">상품명</th>
							<th style="text-align: center">상품 가격</th>
							<th style="text-align: center">상품 정보</th>
							<th style="text-align: center">주문일자</th>
						
						</tr>

						<c:forEach items="${list}" var="customVO">

							<tr>
								<td><div class="cuno" style="margin-top: 8px">${customVO.cuno}</div></td>
								<td>
									<c:choose>
										<c:when test="${customVO.fullName == null}">
											<img src="/resources/dist/img/default-50x50.gif" style="width: 100px; height: 100px;">
										</c:when>
										<c:otherwise>
											<img src="/displayFile?fileName=${customVO.fullName }" style="width: 100px; height: 100px;">
										</c:otherwise>
									</c:choose>
								</td>
								<td><div class="cutitle" style="margin-top: 8px"><a
									href='/user/custom/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&cuno=${customVO.cuno}'>
										${customVO.cutitle} </a></div></td>
										<td><div class="cuprice" style="margin-top: 8px">${customVO.cuprice} 원</div></td>
							<td><div class="cuinfo" style="margin-top: 8px">${customVO.cuinfo}</div></td>
								<td><div class="cudate" style="margin-top: 8px"><fmt:formatDate pattern="yyyy-MM-dd"
										value="${customVO.cudate}" /></div></td>
							<!-- 	<td><span class="badge bg-red"></span></td> -->
							</tr>

						</c:forEach>

					</table>
				</div> 
			</div> <!-- box -->	

				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="seller_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="seller_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="seller_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	</div>

</section>
<!-- /.content -->


<script>

	function chance(no){
		var a = Math.floor(Math.random()*50)+1;
		alert("random value :"+a);		
	}
/* $(document).ready(function(){
	
	$('#random').click(function(){
	var a = Math.floor(Math.random()*50) + 1;
	alert("random value :"+a);
	});
	
	$('.carousel-indicators').find('li').css('background', '#ccc');
	
}); */
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

