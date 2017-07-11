<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../base/main.jsp"%>

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

				 <%-- 	<select name="searchType">
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
					<button id='searchBtn'>Search</button> 
				<!-- 	<button id='newBtn'>New Board</button> --> --%>
					<a href="/user/custom/bill_list" ><button id='newBtn'>판매자 페이지</button></a>
					
				</div> 
			</div>


		
			
				
	<!-- --------------------------------------------------------------------------------------- -->			
		<div class="box">
	<div class="box-header with-border">
					<h3 class="box-title">주문제작 상품 list</h3>
				</div>
    <div class="container">
	<br>
	<br>
        <div class="row">
            <div class="col-md-9" >

                <div class="row carousel-holder">

                    <div class="col-md-12" align="center">
                        <div id="carousel-example-generic"  class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="6"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="7"></li>
                            </ol>
                            <div class="carousel-inner" >
                                <div class="item active">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/목줄.PNG" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/원목 밥그릇.PNG" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/원목 사각장.PNG" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/원목 침대.PNG" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/원목 캣타워.PNG" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/원목 하우스.PNG" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/원목 화장실.PNG" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="/resources/bootstrapPro/img/custom/원목 밥그릇.PNG" alt="">
                                </div>
                              
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div><br>
                                <div class="row">

                  <!--   <div class="col-sm-? col-lg-4 col-md-너비"> -->
                    
	<c:forEach items="${list}" var="customVO">
<div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                          <div class="caption" >
                          
                          
                                <img src="/displayFile?fileName=${customVO.fullName }" width="185" height="150" align="center">
                                <br/>
                                
                                <h4>
                                	<a href='/user/custom/custom_sale${pageMaker.makeSearch(pageMaker.cri.page) }&cuno=${customVO.cuno}' style="font-size: 18px;">${customVO.cutitle}</a>
            <%-- 확률 쓸거 <a href='/user/custom/custom_sale${pageMaker.makeSearch(pageMaker.cri.page) }&cuno=${customVO.cuno}' id="random" onclick="chance(${customVO.cuno})">${customVO.cutitle}</a> --%>
                                </h4>
                         		<div>주문 누적수량 : ${customVO.bsellcount }</div> 
                            </div>
                    <!--         <div class="ratings">
                                <p class="pull-right">12 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>별표 -->
                        </div><!-- thumbnail -->
</div><!-- 기본틀 전체 -->
           </c:forEach>
                                    
                </div><!-- class:row -->
            </div><!-- 슬라이드까지 포함 전체 -->
        </div>
    </div>
    <!-- /.container -->
		
	</div>			
				
		 	<%-- 	<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">CUNO</th>
							<th>TITLE</th>
						
						</tr>

						<c:forEach items="${list}" var="customVO">

							<tr>
								<div><td>${customVO.cuno}</td></div>
								<td>${customVO.cuno}</td>
								<td><a
									href='/user/custom/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&cuno=${customVO.cuno}'>
										${customVO.cutitle} </a></td>
								<td>${customVO.cinfo}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${customVO.cdate}" /></td>
								<td><span class="badge bg-red"></span></td>
							</tr>

						</c:forEach>

					</table>
				</div>  --%>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="custom_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="custom_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="custom_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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

</script>

