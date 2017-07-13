<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

 $(function(){
	$('.remove_proSel').click(function(){
	var cno = $(this).attr('data_cno');
		alert(cno);
	 alert('삭제하시겠습니까?');
	 $.ajax({
		url :'/care_pro_delete/'+cno,
		type :'delete',
		success : function(result){
			alert('삭제 완료!')
			window.location.reload();
		}
	});	// ajax
	});	// click
}); // ready
</script>

<div class="container">
	<div class="row" style="width: 800px">
		<div class="box-body no-padding">
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                       <tr><th>나눔 제목</th><th>나눔 정보</th><th>신청 메모</th><th>나의 주소</th><th>신청 상태</th></tr>
                        <c:forEach var="list" items="${donation_ok }">
                        <tr>
                         <td class="mailbox-subject">${list.dtitle }</td>
			             <td class="mailbox-subject">${list.dinfo }</td>
			             <td class="mailbox-name">${list.damemo }</td>
			             <td class="mailbox-attachment">${list.maddr.split('/')[1] }</td>
			             <td class="mailbox-attachment">${list.dastate }</td>
                        </tr>
                          </c:forEach>
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
                <hr>
                <div class="box-footer no-padding">
                  <div class="text-center">
                        <ul class="pagination">
                           <c:if test="${donation_ok_maker.prev}">
                              <li><a
                                 href="mypage${donation_ok_maker.makeQuery(donation_ok_maker.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${donation_ok_maker.startPage }"
                              end="${donation_ok_maker.endPage }" var="idx">
                              <li
                                 <c:out value="${select13 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${donation_ok_maker.makeQuery(idx)}&tab=donation_ok">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${donation_ok_maker.next && donation_ok_maker.endPage > 0}">
                              <li><a
                                 href="mypage${donation_ok_maker.makeQuery(donation_ok_maker.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->