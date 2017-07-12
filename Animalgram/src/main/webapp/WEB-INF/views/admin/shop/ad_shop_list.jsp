<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../base/ad_main.jsp"%>   

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
<!-- 부트스트랩요기까지 !! -->

<title>제휴 병원 리스트</title>



</head>


<body>
<div id="wrapper">
  <div id="page-wrapper">
	<div class="container-fluid">

		<!-- Page Heading -->
		

		<div class='box-body'>
		<!-- 검색타입 select  -->
		<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							지역</option>
						
					</select>
			<!-- 키워드 검색어 입력 -->
			<input type="text" name='keyword' id="keywordInput"
				value='${cri.keyword }'>
			<button id='searchBtn'>검색</button>
			<!-- 리스틑목로그로 가는버튼 -->
			<button id='newBtn'>처음 목록으로</button>
			<!-- 제휴매장추가버튼 -->
			<button id='addshop'><a href="/shop/addshop">제휴매장추가</a></button>

		</div>
		<!-- /.row -->
		
		<div class="row">
			<div class="col-lg-12">
				<h2>관리자</h2>
				<div class="table-responsive">
					<fieldset>
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									
									<th>매장 이름</th>
									<th>매장 분류</th>
									<th>주소</th>
									<th >전화번호</th>
									<th>상세보기<br>(약도 및 영업시간 등등)</th>
									<th>수정</th>
									<th>삭제버튼</th>
								</tr>
							</thead>
							<tbody>
									<!-- ShopController에서 List<ShopVO>를 "list"로 넘겼다 -->
					             <c:forEach items="${list}" var="ShopVO">
									<tr>
										
										<td>
										
										<b>${ShopVO.shname}</b></td>
										<td>${ShopVO.shtype}</td>
										<td>${ShopVO.shaddr}</td>
										



										<td>
											
												
                                   					   <!-- 전화 image and 말풍선-->
                                   					<div><a href="#">
                                   					   <span>
                                   					     <img src="http://localhost/resources/image/call.png" width="30" height="30"></span>
													     <p class="arrow_box">${ShopVO.shtel}</p></a>
													   </div>
												
																							
											
											
										</td>
									
										<!-- ★★★★★★★★★★★★상세보기 버튼 -->
										<td>
										  
											    <button type="button" class="btn btn-default btn-lg myBtn"
												id="myBtn" >상세보기</button>
												<!-- 좌표 , 영업시간 주차정보    상세보기 버튼밑에 가려져있다.-->
												<input id='a' name="key" type="hidden" value="${ShopVO.shsite }" readonly="readonly"><br>
												<input id='b'name="key" type="hidden" value="${ShopVO.shtime }" readonly="readonly"><br>
												<input id='c'name="key" type="hidden" value="${ShopVO.shparking }" readonly="readonly">
												
												
												
											
										</td>
										<!-- 수정버튼 -->
										<td>	
										        <button type="button" class="btn btn-default btn-lg myBtn2"
												id="myBtn2" >수정버튼</button><br>
												
												<!-- 수정버튼밑에 값들 받아왔음.(modal창에서 끌어다가 쓸라고) -->
											
												<input id='a' name="a" type="hidden" value="${ShopVO.shtype }" readonly="readonly">
												<input id='b' name="b" type="hidden" value="${ShopVO.shname }" readonly="readonly">
												<input id='c' name="c" type="hidden" value="${ShopVO.shaddr }" readonly="readonly">
												<input id='d' name="d" type="hidden" value="${ShopVO.shtel }" readonly="readonly">
												<input id='e' name="e" type="hidden" value="${ShopVO.shtime }" readonly="readonly">
												<input id='f' name="f" type="hidden" value="${ShopVO.shsite }" readonly="readonly">
												<input id='g' name="g" type="hidden" value="${ShopVO.shparking }" readonly="readonly">
												<input id='h' name="h" type="hidden" value="${ShopVO.shno }" readonly="readonly">
												
												</td>
												
												<!-- 삭제버튼 -->
										<td>
												    <button type="button" class="btn btn-default btn-lg myBtn3"
												id="myBtn3" >삭제버튼</button>
												<!-- 삭제시  필요한 shno를 히든으로 담아놨음. -->
												<input id='dno' class='dno' name="key" type="hidden" value="${ShopVO.shno }" readonly="readonly">
										</td>
										
										
									</tr>
					            </c:forEach>
					            
							</tbody>
						</table>
						
						<!-- 상세보기버튼 클릭시 새로운창!! -->
										
													<!-- Modal 어두워지게하는..-->
										   <div class="modal fade" id="myModal" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header" style="padding: 35px 50px;">
														<!-- 상단 x표  -->
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4>천천히~위치확인하기 ⌒⌒</h4>
														</div>
														<div class="modal-body" style="padding: 40px 50px;"> 
															<!--■■■■■■■■■■이 div사이에 구글맵 출력 !! -->
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
																<!--하단 클로즈버튼  -->
																<span class="glyphicon glyphicon-remove"></span> Cancel
															</button>

														</div>
														

													</div>

												</div>
											</div>
										</div>
									</div>
									
										
						<!-- ★★★★★★★★★수정창★★★★★★★★ -->
						
						<script type="text/javascript">
									   
										/* 한글만 입력 유효성 */
									    var korExp=/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]$/;
									    /* 전화번호  입력 유효성 */
									    var telExp = /^\d{1,3}-\d{3,4}-\d{4}$/;
									    /* 운영시간  유효성 */
										var timeExp =/^\d{1,2}:\d{1,2}~\d{1,2}:\d{1,2}$/;
									    /* 주소 */
									    var addrExp=/[ㄱ-ㅎ|가-힣|0-9]$/;


										//유효성 체크 function
									    function modifycheck() {
											//편의를위해 치환.
											alert('hello');
									    	var m = document.modi;
									    	
									        if (m.shtype.value == "") {//매장타입 null값체크
									           alert("매장타입을 입력하세요.");
									            m.shtype.focus();
									        } else if(!korExp.test(m.shtype.value)){//매장타입 한글체크
									        	alert("매장타입엔 한글만 입력가능합니다.(2~15자리수)");
									        	m.shtype.focus();
									        }else if(m.shname.value==""){//매장이름 null값체크
												alert("매장이름을 입력하세요.")        	
									        	
									        	m.mshname.focus();
									        }else if(!korExp.test(m.shname.value)){//매장 타입 한글체크
									        	alert("매장이름엔 한글만 입력가능합니다.(2~10자리수)");
									        	m.mshtype.focus();
									        }else if(m.shaddr.value==""){//주소 null체크
												alert("주소를 입력하세요.");        	
									           m.shaddr.focus();
									        	
									        }else if(!addrExp.test(m.shaddr.value)){ //주소 한글 체크
									        	
									        	alert("주소에는 한글과 숫자만 입력가능합니다.");
									        	
									           m.shaddr.focus();
									        	
									        }else if(m.shtel.value==""){	//전화번호 null값체크
												alert("전화번호를 입력하세요.")        	
									        	alert("ex)010-1234-1234")
									           m.shtel.focus();
									       
									        }else if(!telExp.test(m.shtel.value)){//주소 양식및 숫자체크
									        	
												alert("양식에 맞게 전화번호를 입력하세요.")
												alert("ex)02-1234-1234 , 010-1234-1234")
												
									           m.mshtel.focus();
									        }else if(m.shtime.value==""){//운영시간 null값체크
												alert("운영시간을  입력하세요.")        	
									           m.shtime.focus();
									        	
									        }else if(!timeExp.test(m.shtime.value)){//운영시간 양식및 숫자체크
									        	
												alert("운영시간을 양식에 맞게 입력하세요.");
									        	alert("ex) ex)09:00~22:00");
									        	
									           f.mshtime.focus();
									        }else if(m.shsite.value==""){//좌표값 null체크및 양식및 예시
												alert("위치정보를 ','포함하여 입력하세요.")  
												alert("ex)35.899437,128.638331")
									           m.shsite.focus();
									        	
									        	
									        }else if(m.shparking.value==""){//주차정보null값체크
									           alert("주차정보를 입력하세요.");
									           
									           m.mshparking.focus();
									        } else if (!korExp.test(m.shparking.value)) {//주차정보양식 및 한글체크
									           alert("주차정보에 한글만 입력하세요.");
									           m.shparking.focus();

									        } else
									        	
									           m.submit(); //다됬을시 sumit으로 올려버림.
									   
									     }
									    
										
									
									</script>
					
						
													<!-- Modal 어두워지게하는 .. -->
						<form name=modi method="POST" action="modifyshop">
												
										   <div class="modal fade" id="myModal2" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header" style="padding: 35px 50px;">
														<!-- 상단 클로즈버튼 -->
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4>★제휴매장정보 수정창★</h4>
														</div>
														<div class="modal-body" style="padding: 40px 50px;"> 
															<!--■■■■■■■■■■맵 !! -->
						
					<fieldset>
                      	<table>
                      	<tr>
              					
              					<td>
              					<input class="form-control" placeholder="ex)애견미용,동물병원" type=hidden name="shno" id="shno" size="20">
              					</td>
              			</tr>
                      	  <tr>
                      	        <td align="center">매장타입:</td>
      							<td> <input class="form-control" placeholder="ex)애견미용,동물병원" type="text" name="shtype" id="shtype" size="20"></td>
 						</tr>
						<tr> 
						<td align="center">제휴매장 이름: </td>
						<td><input class="form-control" placeholder="ex)제휴매장 상호명" type="text" name="shname" id="shname" size="20">
								</td>
						</tr>	
						<tr>
                           	<td align="center">주소:</td>
                           	<td>
           						<input class="form-control" placeholder="ex)서울 구로구 구로동" name="shaddr"  type="text" id="shaddr" size="20">
           					</td>
                        </tr>
                        <tr>
                           		<td align="center">전화번호:</td>
                           		<td>
           						<input class="form-control" placeholder="ex)010-6808-1234 '-'포함 " name="shtel" type="text" id="shtel" size="20">
           						</td>
                        </tr>
                           		<tr>
                           		<td align="center">운영시간:</td>
                           		<td>
           						<input class="form-control" placeholder="ex)07:00~21:00 '~'포함 " name="shtime" type="text" id="shtime" size="20"></td>
                        </tr>
                        <tr>
                           		<td align="center">위치정보:</td>
                           		<td>
           						<input class="form-control" placeholder="35.899437-128.638331" name="shsite" type="text" id="shsite" size="20">
           						</td>
           						<td>
           						<b><a href="https://www.google.co.kr/maps/@37.529703,126.963843,14z" target="_blank">※좌표수정시, <br>※클릭하여 좌표 보기.</a></b>
           						</td>
                        </tr>
                        <tr>
                           		<td align="center">주차유무:</td>
                           		<td>
           						<input class="form-control" placeholder="ex)주차가능,주차공간협소" type="text" name="shparking" id="shparking" size="20">
              					</td>
                        </tr>
              			
                      </table>
                               
                                
                               
                                <!-- Change this to a button or input when using this as a form -->
                                <!-- 수정버튼 -->
                                <button type="button" class="btn btn-lg btn-success btn-block" id="modify-btn-primary" onclick=modifycheck();>수정</button><br>
                                <!-- 나가기버튼 -->
                                <a href="index.html" class="btn btn-danger btn-default pull-right" data-dismiss="modal">나가기
																<span class="glyphicon glyphicon-remove"></span></a>
															
                              <font color=red>※ 수정 할 시 빈칸 없이 입력하세요.</font>
                            </fieldset>
                            
													    </div> 
													
														

													</div>

												</div>
											</div>
											</form>
												
						<!-- ★★★★★★★삭제버튼★★★★★★ -->
												<!-- Modal 어두어지게하는..-->
										   <div class="modal fade" id="myModal3" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<!-- 상단 x표버튼  -->
														<div class="modal-header" style="padding: 35px 50px;">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4>정말로 삭제 :)~!?!?</h4>
														</div>
														<div class="modal-body" style="padding: 40px 50px;"> 
															<!--■■■■■■■■■■맵 !! -->
										
												<!-- 혹시몰라서 끌어온 shno -->
											<input type="hidden" id='deleteshno' readonly="readonly">
											<!-- Change this to a button or input when using this as a form -->
											<hr color="green">
											<hr color="green">
											<hr color="green">
											<!-- 삭제버튼 -->
											<button type="button" 
												class="btn btn-lg btn-success btn-delete" id="delete-btn-primary">삭제합니다.</button>
												
												<!-- 나가기버튼  -->
											<a href="index.html"
												class="btn btn-danger btn-default pull-right"
												data-dismiss="modal">나가기 <span
												class="glyphicon glyphicon-remove"></span></a>
												
											<hr color="green">
											<hr color="green">
											<hr color="green">

										

									                      </div> 
													
														

													</div>

												</div>
											</div>
						
						
						<!-- 페이징 출력 하단 1 2 3 4 5 6 7 8 9 10 버튼  -->
						 <div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="ad_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="ad_list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="ad_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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
	 /* 구글맵에 사용할 좌표 변수 임의값 할당  */
	 var x=37.554678; 
	 var y=126.970766;
	 
	 
	 /* shopno,~shopparking정보 받을 임의변수값들  */
	 var infoshno;
	 var infoshtype;
	 var infoshname;
	 var infoshaddr;
	 var infoshtel;
	 var infoshtime;
	 var infoshsite;
	 var infoshparking;
	 
	 
	 
	 
	 /* 상세보기버튼클릭시 창하나 띄우는것*/
	  $(function(){
	      $(".myBtn").click(function(){
	    	  /* 모달창을 가렸다가 보이는 이유: 한번 가렸다가출력해야지 모달창안에 googleMap정상적으로나옴.그래서 구글맵에 대한 제일큰 div를  
	    	        가렸다가 보이게함 */
	    	  $("#myModal").hide();
	    	  $("#myModal").show();
	      	  
	    	 /* 버튼밑에 히든으로 가져진 값들 가져옴 */
		      	    shtime=$(this).next().next().next().val();
		 			shparking=$(this).next().next().next().next().next().val();
	      	   
		 	/* 위에정한  임의변수에 할당 */		
	      	  $("#infoparking").html(shparking+"");
	      	  $("#infotime").html(shtime+"");
	      	  
	      	  /* DB에 저장된 좌표값(37.123456,126.123412)로 되어있어서 split(',')사용 */
	      	var strArr = $(this).next().val().split(',');
	      	  /* 좌표값을 임의 변수 x,y에대입 */
	      	  x= parseFloat(strArr[0]);
	      	  y= parseFloat(strArr[1]);
	      	  /* 구글맵 호출 */
	      			myMap();
	      	  /* 버튼 클릭시 모달창띄움 */
	        	 $("#myModal").modal(); 
	      });
	  });
	 
	 
	 
	 /* 수정 버튼클릭시 창하나 띄우는것*/
	  $(function(){
	      $(".myBtn2").click(function(){
	    	  
	    	  /*mymodal2 div를 가렸따가 보이게하는이유 : 상세보기버튼이랑 이유가같음  */
	    	  /* 모달창을 가렸다가 보이는 이유: 한번 가렸다가출력해야지 모달창안에 googleMap정상적으로나옴.그래서 구글맵에 대한 제일큰 div를  
	    	        가렸다가 보이게함 */
	    	  $("#myModal2").hide();
	    	  $("#myModal2").show();
	      	  
	    	 	/* 수정버튼밑에 가져온 히든값들을 하나하나 임의 변수에 적용시킴 */
		      	    infoshtype=$(this).next().next().val();
		      	    infoshname=$(this).next().next().next().val();
		      	    infoshaddr=$(this).next().next().next().next().val();
		      	     infoshtel=$(this).next().next().next().next().next().val();
		           	infoshtime=$(this).next().next().next().next().next().next().val();
		      	    infoshsite=$(this).next().next().next().next().next().next().next().val();
		      	 infoshparking=$(this).next().next().next().next().next().next().next().next().val();
		      		  infoshno=$(this).next().next().next().next().next().next().next().next().next().val();
		 		
		 	
	   				/* 수정폼에 띄울 값들을 입력 */	   	   
			      	  $("#shtype").val(infoshtype+"");
			      	  $("#shname").val(infoshname+"");
			      	  $('#shaddr').val(infoshaddr+"");
			      	  $("#shtel").val(infoshtel+"");
			      	  $("#shtime").val(infoshtime+"");
			      	  $("#shsite").val(infoshsite+"");
			      	  $("#shparking").val(infoshparking+"");
		 	      	  $("#shno").val(infoshno+"");
	      	 
	      	  
	      	  
	      	  /* 수정모달창 보여라~! */
	          $("#myModal2").modal();
	          
	         
	          
	          
	          
	      });
	  });
	 


	 
	 //리스트에서 보이는 삭제버튼
	 
	 $(function(){
	      $(".myBtn3").click(function(){
	    	  /*mymodal3 div를 가렸따가 보이게하는이유 : 상세보기버튼이랑 이유가같음  */
	    	  /* 모달창을 가렸다가 보이는 이유: 한번 가렸다가출력해야지 모달창안에 googleMap정상적으로나옴.그래서 구글맵에 대한 제일큰 div를  
	    	        가렸다가 보이게함 */
	    	  $("#myModal3").hide();
	    	  $("#myModal3").show();
	      	  
						//리스트에서보이는 삭제버튼밑에있는 히든으로 가린 shno값을 가져옴 
		      		  infoshno=$(this).next().val(); 
		      	 
		      	 /* 임의 변수에 할당 */
		 		$("#deleteshno").val(infoshno+"");
	      	    
	      	  
	      	  
	      	  	/* 삭제버튼 클릭시 나오는 모달창 호출 */
	          $("#myModal3").modal();
	          
	         
	          
	         
	      });
	  });
	
	 
	 
 	//삭제창안에 삭제버튼눌럿을떄
 	$(function() {

		$('#delete-btn-primary').on(
				"click",
				function(event) {
					/* 쿼리문생성
					ex)localhost/deleteshop?shno=3
					*/
					self.location = "deleteshop"
							+ '${pageMaker.deletemakeQuery()}'//?shno=
							+ encodeURIComponent($('#deleteshno').val());

				});//

			    

	});
	 
 	
	 
	 
     /* map을위해 띄운창안에 맵에대한 function */
      		function myMap() {
    	      /* 구글맵이 들어간 div아이디를 찾음 */
      		  var mapCanvas = document.getElementById("map");
    	      
    	      /* DB에 가져온 좌표값을 입력.(x,y)  */
      		  var myCenter = new google.maps.LatLng(x,y); 
    	      /* 위치밑 확대 zoom값 */
      		  var mapOptions = {center: myCenter, zoom: 16.0};
    	      /* div아이디 ='map'안에 위에값들 대입 */
      		  var map = new google.maps.Map(mapCanvas,mapOptions);
    	      /* 구글맵에 대한 애니메이션 정의 (점프 : 띠용띠용 기능.) */
      		  var marker = new google.maps.Marker({
      		    position: myCenter,
      		    animation: google.maps.Animation.BOUNCE
      		  });
    	      /* 보이게될 map에 애니메이션기능밑 부가정보 대입   */
      		  marker.setMap(map);
      	     	  
      		
      		}//myMap
      		
      		
      		
      	
      	/* google map key 콜백함수 오류가안나려고 임의 function생성. */
      	function mapCallback(){
      		
      		 
      	}
      	
      	
      	/*검색에대한  */
      	$(function() {
						/* 검색버튼클릭시 */
    				$('#searchBtn').on(
    						"click",
    						
    						function(event) {
								/* 쿼리문생성
								ex)localhost/ad_list?page=1&perPageNum=5&searchType=서울
								*/
    							self.location = "ad_list"
    									+ '${pageMaker.makeQuery(1)}'//?page=1&perPageNum=5&searchType=
    									+ "&searchType="
    									+ $("select option:selected").val()
    									+ "&keyword=" + encodeURIComponent($('#keywordInput').val());

    						});//
    						/* 리시트에 보이는 처음목록으로 버튼*/
    				$('#newBtn').on("click", function(evt) {
						/* URL주소를 localhost/ad_list로 바꾼다. */
    					self.location = "ad_list";

    				});

    			});
      	
    			//제휴매장추가완료시 컨트롤러에서 "msg"키값으로 "success"넘긴다.
    			var result = '${msg}';
    		    
    		    if(result == 'SUCCESS'){
    		    	alert("처리가 완료되었습니다.");
    		    }
    		    

</script>
<!-- 구글키값.이것이없으면 구글map이 안뜬다. key출력은 구글계정당 여러개가 될수있다 콜백 함수때문에 콜백 function밑으로가야함
	 혹시몰라 제일밑에위치했음.
-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDN_j4cDpN3ViAk_6gmN5uRm5HKN1wh4tg&callback=mapCallback"></script>
</body>





