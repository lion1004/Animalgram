<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/navbar.jsp" %>

<div id="wrapper">
        
        <!-- Page Content -->
        <div id="page-wrapper">
             <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                         ${amember.mno}번 ${amember.mname } 회원의 정보 수정
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

			<div class="row">
				<form class="form-horizontal" method="POST">
				  <input type='hidden' name='page' value="${cri.page}"> 
        		  <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	   	 		  <input type='hidden' name='searchType' value="${cri.searchType}">
	    		  <input type='hidden' name='keyword' value="${cri.keyword}">
					<div class="form-group">
						<label class="col-sm-2" for="idmail">이메일:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Email"
								name="idmail" style="width: 260px;" maxlength="30"
								value="${amember.idmail }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="mpass">비밀번호:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Password"
								name="mpass" style="width: 260px;" maxlength="30"
								value="${amember.mpass }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="mhint">힌트:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Hint"
								name="mhint" style="width: 240px;" maxlength="10"
								value="${amember.mhint }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="nickname">닉네임:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Nickname"
								name="nickname" style="width: 200px;" maxlength="10"
								value="${amember.nickname }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="nickname">생일:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${amember.birth }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="nickname">성별:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${amember.mgender }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="nickname">등급:</label>
						<div class="col-sm-10">
							<select class="form-control" style="width: 120px;" name="job">
								<option>user</option>
								<option>seller</option>
								<option>pro</option>
								<option>admin</option>
								</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="mtel">전화번호:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Tel."
								name="mtel" style="width: 200px;" maxlength="6"
								value="${amember.mtel }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="maddr">주소:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Address"
								name="maddr" style="width: 200px;" maxlength="6"
								value="${amember.maddr }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="favorite">관심사:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Favorite"
								name="favorite" style="width: 200px;" maxlength="6"
								value="${amember.favorite }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="mdate">가입일:</label>
						<div class="col-sm-10">
							<p class="form-control-static">
								<fmt:formatDate value="${amember.mdate}" type="date"
									pattern="yyyy-MM-dd hh:mm:ss" />
							</p>
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<div class="col-sm-offset-4">
							<a class="btn btn-default">목록</a>
							<a class="btn btn-primary">수정</a> 
							<a class="btn btn-warning">초기화</a>
						</div>
					</div>
				</form>
			</div>

			<!-- /.container-fluid -->
           </div>
        
        </div>
        <!-- /#page-wrapper -->
        </div>
        <form name="role">
        	
	    </form>
	    
         <script type="text/javascript">
        	  var msg = '${msg}';
        	 if(msg!=null && msg.trim().length > 1){
        		 alert(msg);
        	 } 
        	
        $(document).ready(function(){
        	
        	$(".btn-default") //목록
				.on("click",function() {
					self.location = "/admin/mem_list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});
        	
        	var form = $(".form-horizontal");
        	$(".btn-primary").on("click",function(){ //수정
        		form.submit();
        	});
        	
        	$(".btn-warning").on("click",function(){
        		location.reload(true);
        	});
        	
        });
          
         </script>
        </body>
        </html>
   
