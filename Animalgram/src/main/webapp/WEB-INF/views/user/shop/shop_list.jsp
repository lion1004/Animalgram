<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../base/main.jsp"%>   

<!DOCTYPE html >
    

<style>
#menu {
  width: 420px;
  margin: 0 auto;
}
#menu div {
  position: relative;
  width: 28%;
  float: left;
  margin: 1%;
  text-align: center;
  
}
#menu div a {
    display: block;
    padding: 1%;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.arrow_box {
  display: none;
  position: absolute;
  padding: 16px;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 10%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

span:hover + p.arrow_box {
  display: block;
}
</style>



 

<head>

<!-- 부트스트랩  -->
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">




  
 <style>
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
   
 
      
  </style> 
<!-- 부트스트랩 요기까지 !! -->

<title>제휴 병원 리스트</title>



</head>


<body>

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">애니멀그램 제휴 매장 리스트</h1>

			</div>
		</div>

		<div class='box-body'>
		<!-- 검색 타입 -->
		<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							지역</option>
						
					</select>
<!-- 키어드 검색 -->
			<input type="text" name='keyword' id="keywordInput"
				value='${cri.keyword }'>
			<button id='searchBtn'>검색</button>
			<button id='newBtn'>처음목록으로</button>

		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-6">
			
				<div class="table-responsive">
					<fieldset>
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									
									<th>매장 이름</th>
									<th>매장 분류</th>
									<th>주소</th>
									<th width="10">전화번호</th>
									<th>상세보기(약도 및 영업시간 등등)</th>
								</tr>
							</thead>
							<tbody>
							<!-- 컨트롤러에서 List<ShopVO>받아옴  -->
					             <c:forEach items="${list}" var="ShopVO">
									<tr>
										
										<td>${ShopVO.shname}</td>
										<td>${ShopVO.shtype}</td>
										<%-- <a href='/admin/shop/ad_shop_list?shno=${ShopVO.shno}'>${ShopVO.shname}</a></td> --%>
										<td>${ShopVO.shaddr}</td>



										<td>
											
											
                                   					<div><a href="#">
                                   					   <span><img src="http://localhost/resources/image/call.png" width="30" height="30"></span>
													     <p class="arrow_box">${ShopVO.shtel}</p></a>
													   </div>
												
												
												<!-- 
<div id="menu">
  <div><a href="#">
  <span>menu01</span>
    <p class="arrow_box">balloon1</p></a>
  </div>
 
</div> -->
																							
											
											
										</td>
									
										<!-- ★★★★★★★★★★★★상세보기 버튼 -->
										<td>
										  
											<button type="button" class="btn btn-default btn-lg myBtn"
												id="myBtn" >상세보기</button>
												<input id='aaa' name="key" type="hidden" value="${ShopVO.shsite }" readonly="readonly"><br>
												<input id='bbb'name="key" type="hidden" value="${ShopVO.shtime }" readonly="readonly"><br>
												<input id='ccc'name="key" type="hidden" value="${ShopVO.shparking }" readonly="readonly">
												
												
											
										</td>
										
										<!-- ★★★★★★★★★★★★상세보기 버튼 -->
									</tr>
					            </c:forEach>
					            
							</tbody>
						</table>
						
						<!-- 상세보기 눌렀을시 뜨는 새로운창!! -->
										
													<!-- Modal -->
										   <div class="modal fade" id="myModal" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header" style="padding: 35px 50px;">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4>천천히~위치확인하기 ⌒⌒</h4>
														</div>
														<div class="modal-body" style="padding: 40px 50px;"> 
															<!--■■■■■■■■■■맵 !! -->
															<div id="map" style="width:100%; height:500px"></div>
															<hr>
															<font color=gray>★★영업(진료)시간★★</font><div id="infotime"></div>
															<font color=red>※※※※※ <div id="infoparking"></div></font> 
															<font color=red>※※※※※</font> 
															<hr>

													    </div> 
														<div class="modal-footer">
															<button type="submit"
																class="btn btn-danger btn-default pull-right"
																data-dismiss="modal">
																<span class="glyphicon glyphicon-remove"></span> Cancel
															</button>

														</div>
														

													</div>

												</div>
											</div>
						
						
						<!-- 페이징 출력   (하단 1 2 3 4 5 6 7 8 9 10)번호-->
						 <div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div> 
						<!-- 페이징관련 여기까지 -->

					</fieldset>
				</div>
			</div>

		</div>


	</div>
	<!-- 구글 맵 key-->
	<script>
	 /* 구글맵 x,y 임의값  */
	 var x=37.554678; 
	 var y=126.970766;
	 
	 /* 상세보기에 띄울 영업시간 주차정보 변수  */
	 var shtime;
	 var shparking;
	 
	 /* 버튼클릭시 창하나 띄우는것*/
	  $(function(){
	      $(".myBtn").click(function(){
	    	  $("#myModal").hide();
	    	  $("#myModal").show();
	      	  
	    	/* 상세보기 버튼 밑에 영업시간 , 주차정보 끌어온것들을 input  hidden으로 가려뒀음 . */	
	      	  shtime=$(this).next().next().next().val();
	 			shparking=$(this).next().next().next().next().next().val();
	 			
	 			
    	   /* 상세보기 모달창에 끌어온값들 입력.  */
    	  		$("#infoparking").html(shparking+"");
    	  		$("#infotime").html(shtime+"");
    	  
	      	  /* 상세보기 버튼 밑에 끌어온 좌표값을 임의 변수로 가져옴.
	      	  ex) 35.123412,126.123132
	      	  */
	      	var strArr = $(this).next().val().split(',');
	      	  x= parseFloat(strArr[0]);
	      	  y= parseFloat(strArr[1]);
	      	 
	      	  //모달창에 맵보이게
	      	  myMap();
	      	  //버튼 눌렀을때 모달창 띄우게한다. 
	          $("#myModal").modal();
	      });
	  });
	 
     /* 띄운창안에 맵에대한 function */
      		function myMap() {
    	     /* id="map"div를 찾는다. */
      		  var mapCanvas = document.getElementById("map");
    	     /* 값할당한 x,y를대입  */
      		  var myCenter = new google.maps.LatLng(x,y); 
    	     /* 구글맵 zoom(확대)값들 및 위치 */
      		  var mapOptions = {center: myCenter, zoom: 16.0};
    	     /* 위에정의한 구글맵정보에 부가정보 입력후 div=map에 넣음. */
      		  var map = new google.maps.Map(mapCanvas,mapOptions);
    	     /* 애니메이션효과및 위치조정  */
      		  var marker = new google.maps.Marker({
      		    position: myCenter,
      		    animation: google.maps.Animation.BOUNCE
      		  });
    	     /* 위에 애니메이션및 부가정보들을 최종적으로 map에 적용시킴. */
      		  marker.setMap(map);
      	     	  
      		
      		}//myMap
      		
      		
      		
      	
     
      		 //구글키값이 콜백함수를 원해서임의로생성 (오류방지차원) 
      	function mapCallback(){
      		
      	}
      	
      		
      		/* 검색버튼 눌렀을시 */
      	$(function() {

    				$('#searchBtn').on(
    						"click",
    						function(event) {
						/*  URL생성 
						ex) list?page=1&perPageNum=5&searchType=지역&keyword=서울 
						*/
    							self.location = "list"
    									+ '${pageMaker.makeQuery(1)}'
    									+ "&searchType="
    									+ $("select option:selected").val()
    									+ "&keyword=" + encodeURIComponent($('#keywordInput').val());

    						});

      					/* 처음목록으로 버튼 눌렀을시 
      					 localhost/list로 이동.
      					*/
    				$('#newBtn').on("click", function(evt) {

    					self.location = "list";

    				});

    			});
</script>

<!-- 구글맵 key값
맨밑에있는이유 : 최소한 콜백함수(mapCallback) function밑에있어야한다.
혹시몰라제일밑으로 내림.

 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDN_j4cDpN3ViAk_6gmN5uRm5HKN1wh4tg&callback=mapCallback"></script>


</body>





