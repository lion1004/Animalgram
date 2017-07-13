<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file="../base/main.jsp" %>

        <div id="page-wrapper">

            <div class="container-fluid">

				<form role="form" method="post">

					<input type='hidden' name='cuno' value="${customVO.cuno}">
					<input type='hidden' name='cutitle' value="${customVO.cutitle}">	 				
				    <input type='hidden' name='page' value="${cri.page}">
					<input	type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

		

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">요청 상품 정보</h3>
              		<div>
              			<img src="/displayFile?fileName=${customVO.fullName}" width="200" height="100">
              			<label style="font-size: 40px;margin-right: 150px;" >상품명 :${customVO.cutitle}</label><br>
              			<label style="font-size: 20px;margin-left: 250px;" >상품 금액 :${customVO.cuprice} 원</label>
              		
              		</div>
              		
                    </div>
                </div>
                <hr>
                
                <h3 class="page-header">수취인 배송 정보</h3>
               

                <div class="row">
                    <div class="col-lg-6">

                   

                            <div class="form-group">
                                <label>받으시는 분</label>
                                <input class="form-control" id="mname" name="mname" value="${customVO.mname}">
                            </div>
                            
                            <div class="form-group">
                                <label>주문 수량</label>
                                <input class="form-control" id="bcount" name="bcount" value="${bcount }" readonly>
                            </div>

                            <div class="form-group">
                                <label>주소</label>
                                <input class="form-control" id="bdeli" name="bdeli" placeholder="Enter text"  value="${customVO.maddr}">
                            </div>
                            
              
                            
                            <div class="form-group">
                                <label>전화번호</label>
                                <input  class="form-control" id="mtel" name="mtel" placeholder="Enter text" value="${customVO.mtel}">
                            </div>

                            <div class="form-group">
                                <label>배송 메시지(택배기사님에게..)</label>
                                <textarea class="form-control" id="bmemo" name="bmemo" rows="3"></textarea>
                            </div>
					</div>
					</div>
					</form>
                   <button type="submit" class="btn btn-primary" id="resultBtn">주문</button>
                   <button type="reset" class="btn btn-primary" id="cancelBtn">취소</button>
 
            </div>
            <!-- /.container-fluid -->

        </div>
     
        <!-- /#page-wrapper -->

<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#resultBtn").click(function(){
		
	
	 	 if($("#mname").val() == ""){
			alert('받으시는 분의 성함을 입력하십시오.');
			$("#mname").focus();
			}else if($("#bdeli").val() == ""){
				alert('주소를 입력하십시오.');
				$("#bdeli").focus();
			}else if($("#mtel").val() == ""){
				alert('전화번호를 입력하십시오.');
				$("#mtel").focus();
			}else if($("#bmemo").val() == ""){
				alert('배송 메시지를 입력하십시오.');
				$("#bmemo").focus();
			}else{
				
			alert("주문이 완료 되었습니다.");
			formObj.attr("method", "POST");
			formObj.attr("action", "/user/custom/billask");
			formObj.submit();
			}
	
	
	});
	
	
/* 	$("#resultBtn").on("click", function(){
		alert('주문이 완료 되었습니다.');
		$(location).attr('href','/user/custom/custom_list');
	});
	 */
	
	
	$("#cancelBtn").on("click", function(){
		alert('취소 되었습니다. 첫 상품 화면으로 이동합니다.');
	self.location='/user/custom/custom_list';
	});
});

</script>