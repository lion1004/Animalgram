<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../base/main.jsp"%>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           	소모임 정보보기
                        </h1>
              
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">

                        <form role="form" method="post">
                            <div class="form-group">
                                <label>소모임 제목</label>
                                <input class="form-control" readonly="readonly" value="${groupVO.gtitle}">
                            </div>
                            <div class="form-group">
                                <label>소모임 장소</label>
                                <input class="form-control" readonly="readonly" value="${groupVO.gplace}">
                            </div>
                      		<div class="form-group">
                                <label>소모임 인원</label>
								<input class="form-control" readonly="readonly" value="${groupVO.gcount}명 / ${groupVO.glimit}명">
                      		</div>
                            <div class="form-group">
                                <label>소모임 날짜</label>
								<input class="form-control" readonly="readonly" value="${groupVO.gdate}">
                            </div>
                            <div class="form-group">
                                <label>참여가능 반려동물</label>
								<input class="form-control" readonly="readonly" value="${groupVO.gtype}">
                            </div>
                            <div class="form-group">
                    			 <img src="${groupVO.gimage}" alt="">
                            </div>
                            <div class="form-group">
                                <label>참여자 정보</label>
                                <select multiple class="form-control">
									<%-- <c:forEach items="${personlist }" var="memberVO" varStatus="stat">
										<option value="">${memberVO.nickname}(${memberVO.mname})</option>
									</c:forEach> --%>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">✿참여 하기✿</button>
 							<a href="/group/list" class="btn btn-default">✿목록으로 가기✿</a>
 							<a href="/group/modi?gno=${groupVO.gno}" class="btn btn-default">✿수정 하기✿</a>
 							<a href="/group/delete?gno=${groupVO.gno}" class="btn btn-default">✿삭제 하기✿</a>
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
