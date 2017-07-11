<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../base/main.jsp"%>
<%@include file="../animal/animal_confirm.jsp"%>
<%@include file="../login/pro_confirm.jsp"%>
<%@include file="../login/sel_confirm.jsp"%>

<script type="text/javascript">
     $(function(){
    	if('${param.tab}' != ''){
    		//alert("enter: "+ $("a[href='#${param.tab}']").parent().html())
    	 $("a[data-toggle='tab']").parent().removeClass('active');
    	 // 추가
    	 $("a[href='#${param.tab}']").parent().addClass('active');
    	 
    	 // 내용 Active 삭제
    	 $(".tab-content div").removeClass('in active');
    	 // 추가
    	 $("#${param.tab}").addClass('in active');
    	}
    	 
    	// 전문가 활성화
	     if('${job}' == 'pro'){
	    	 $('#pro_sel_tab').parent().addClass('in active');
	    	 $('#training_sel_pro').addClass('active');
	     }

    	// 판매자 활성화
	     if('${job}' == 'seller'){
	    	 $('#custom_tab').parent().addClass('in active');
	    	 $('#custom_seller').addClass('active');
	     }
	     
    	// 전문가 tab 관리
	 	  if('${param.tab}' == 'training_pro'){
	 		 $('[href="#training_sel_pro"]').parent().removeClass('active');
	 		 $("#training_sel_pro").removeClass('in active')
	 	 }
	 	  
	 	  if('${param.tab}' == 'training_pro_comit'){
	 		 $('[href="#training_sel_pro"]').parent().removeClass('active');
	 		 $("#training_sel_pro").removeClass('in active');
	 		 
	 		 $('#pro_tab').parent().addClass('active');
	 	  }
	 	  
	 	  // 판매자 tab 관리
	 	 if('${param.tab}' == 'bill_sel'){
	 		$('[href="#custom_seller"]').parent().removeClass('active');
	 		$('#custom_seller').removeClass('in active');
	 		
	 		$('#bill_tab').parent().addClass('active');
	 		$('#bill_seller').addClass('in active');
	 	 }
	 	  
	 	 if('${param.tab}' == 'bill_comit_sel'){
	 		$('[href="#custom_seller"]').parent().removeClass('active');
	 		$('#custom_seller').removeClass('in active');
	 		
	 		$('#bill_tab').parent().addClass('active');
	 		$('#bill_seller').addClass('in active');	
	 	 }
 	  
     });
 </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<hr>
<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"><b>NickName </b><h2>${user } </h2></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              
          <ul class="list-group">
            <li class="list-group-item text-muted">Profile</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>아이디</strong></span>${mem.idmail }</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>생년월일</strong></span>${mem.birth }</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>회원등급</strong></span>${mem.job }</li>            
            <li class="list-group-item text-right"><span class="pull-left"><strong>나의 관심분야</strong></span>${mem.favorite }</li>            
            <li class="list-group-item text-right"><span class="pull-left"><strong>가입 날짜</strong></span>${mem.mdate }</li>
          </ul> 

          <div class="panel panel-default">
            <div class="panel-heading">등록하기<i class="fa fa-link fa-1x"></i></div>
            <c:if test="${job == 'user'}">
            <div class="panel-body"><a id="animal_confirm" style="cursor: pointer;">애완동물 등록하기</a></div>
            </c:if>
            <div class="panel-body"><a id="pro_confirm" style="cursor: pointer;">전문가 등록하기</a></div>
            <div class="panel-body"><a id="seller_confirm" style="cursor: pointer;">판매자 등록하기</a></div>
          </div>
          
          <ul class="list-group">
            <li class="list-group-item text-muted">활동 내역 <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>글 작성 수</strong></span> 125</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>댓글 작성 수</strong></span> 13</li>
          </ul> 
     
        </div><!--/col-3-->
    	<div class="col-sm-9">
          <ul class="nav nav-tabs" id="myTab">
         
          <c:if test="${job == 'user' }">
            <li class="active"><a href="#matching" data-toggle="tab">소모임 현황</a></li>
          </c:if>

          <c:if test="${job == 'pro' }">
            <li><a href="#training_sel_pro" id="pro_sel_tab" data-toggle="tab">훈련 일정 현황</a></li>
            <li><a href="#training_pro" id="pro_tab" data-toggle="tab">훈련 요청 현황</a></li>
          </c:if>
          
          <c:if test="${job == 'seller' }">
            <li><a href="#custom_seller" id="custom_tab" data-toggle="tab">판매 물품 현황</a></li>
            <li><a href="#bill_seller" id="bill_tab" data-toggle="tab">판매 요청 현황</a></li>          
          </c:if>
                   
            <c:if test="${job == 'user' }">
            <li><a href="#training" data-toggle="tab">훈련 현황</a></li>
            <li><a href="#market" data-toggle="tab">장터 현황</a></li>
            <li><a href="#donation" data-toggle="tab">나눔 현황</a></li>
            <li><a href="#center_list" data-toggle="tab">고객 센터 문의</a></li>            
            <li><a href="#petUp" data-toggle="tab">펫 정보 보기</a></li>
            </c:if>
         
            <li><a href="#settings" data-toggle="tab">정보 수정</a></li>
         
          </ul>
              
            
          <div class="tab-content">
          	<!-- 소모임 현황 확인 -->
          	<c:if test="${job == 'user'}" >
            <div class="tab-pane active" id="matching">
             <hr>
             <%@ include file="../member/member_agroup.jsp" %>
          	</div>
            </c:if> 
            
            <c:if test="${job == 'user'}">
             <!-- 훈련 현황 User용-->
             <div class="tab-pane" id="training">
             <hr>
             <%@ include file="../member/member_care.jsp" %>
             </div>
            </c:if>
            
              <c:if test="${job == 'pro'}">
             <!-- 훈련 현황  Pro용-->
             <div class="tab-pane" id="training_sel_pro">
             <hr>
             <%@ include file="../member/member_care_select_pro.jsp" %>
             </div>
             <!-- 훈련 요청 현황 Pro용-->
             <div class="tab-pane" id="training_pro">
             <hr>
             <%@ include file="../member/member_care_pro.jsp" %>
             </div>
             <!-- 훈련 요청 현황 Pro용-->
             <div class="tab-pane" id="training_pro_comit">
             <hr>
             <%@ include file="../member/member_care_pro.jsp" %>
             </div>
             </c:if>
            
             <c:if test="${job == 'seller'}">
              <!-- 판매 물품 현황 -->
               <div class="tab-pane" id="custom_seller">
             <hr>
             <%@ include file="../member/member_custom.jsp" %>
             </div>
             <div class="tab-pane" id="bill_seller">
             <hr>
             <%@ include file="../member/member_bill.jsp" %>
             </div>
             </c:if>
             
             <c:if test="${job == 'user' }">
              <!-- 펫 정보 수정 확인 -->
	          <div class="tab-pane" id="petUp">
	          	  <%@ include file ="../animal/animal_info.jsp"%>
	          </div>
              <!-- 고객 센터 확인 -->
	          <div class="tab-pane" id="center_list">
	          	  <%@ include file ="../center/center_list.jsp"%>
	          </div>
	          </c:if>
             
             <!-- 회원 정보 수정 -->
	          <div class="tab-pane" id="settings">
	             <br>
	               <%@ include file ="../member/member_modify.jsp"%>
	          </div>
	          
              </div><!--/tab-content-->
          </div><!--/col-sm-9-->

        </div><!--/row-->
    </div><!--/container-->
                                                      