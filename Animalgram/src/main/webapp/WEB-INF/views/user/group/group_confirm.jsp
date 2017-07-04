<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

  	<script>
  		$(function() {
  			$( "#calendar" ).datepicker({   
  				minDate: 1,
  	          	maxDate: "+1M"
  	          });
      		$( "#calendar" ).datepicker( "option", "dateFormat", "yy년 mm월 dd일" );
      		$( "#calendar" ).datepicker( "option", "showAnim", "show" );
  		 });
  		
  		
  	</script>


        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           	소모임 개설하기
                        </h1>
              
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form id="inputForm"  action="/group/input" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label>소모임 제목</label>
                                <input class="form-control" name="gtitle">
                                <p class="help-block">특정 대상과 반려동물을 비방하는 내용의 글은 작성자 동의없이 삭제 될 수 있음을 알려드립니다.</p>
                            </div>
                            <div class="form-group">
                                <label>소모임 장소</label>
                                <input class="form-control" name="gplace" placeholder="ex)서울시 금천구 가산디지털 1로  149(신한이노플렉스)">
                            </div>
                      		<div class="form-group">
                                <label>소모임 인원</label>
                                <select class="form-control" name="glimit">
                                    <option value="2">-기본값-</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                    <option value="6">6명</option>
                                    <option value="7">7명</option>
                                    <option value="8">8명</option>
                                    <option value="9">9명</option>
                                    <option value="10">10명</option>
                                    <option value="99">제한없음</option>
                                </select>
                      		</div>
      
                            <div class="form-group">
                                <label>소모임 날짜</label>
                                <input readonly="readonly" name="gdate" id="calendar" class="form-control">
                                <p class="help-block">날짜를 선택해주세요. 당일 모임은 불가능 합니다.</p>
                            </div>
                            <div class="form-group">
                                <label>참여가능 반려동물</label>
                                <select class="form-control" name="gtype">
                                    <option>강아지</option>
                                    <option>고양이</option>
                                    <option>기타</option>
                                </select>
                      		</div>
                            <div class="form-group">
                                <label>소모임 사진</label>
                                <input type="file" name="file" >
                            </div>

                            <button type="submit" class="btn btn-primary">✿개설하기✿</button>
                            <button type="reset" class="btn btn-default" onclick="history.back()">✿취소하기✿</button>

            </div>
            <!-- /.container-fluid -->


        
        </div>
        <!-- /#page-wrapper -->
        <hr>
    	<br>
        <!-- Footer -->
    	<footer>
        	<div class="container">
            	<div class="row">
                	<div class="col-lg-6">
                    	<p>Copyright &copy; AnimalGram Corp. Make by 홍일점</p>
                	</div>
            	</div>
            	<!-- /.row -->
        	</div>
    	</footer>
        <br>

