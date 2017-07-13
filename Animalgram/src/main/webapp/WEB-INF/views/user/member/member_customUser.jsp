<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

 $(function(){
	$('.remove_cusUser').click(function(){
	var bno = $(this).attr('data_bno');
	 alert('주문취소 하시겠습니까?');
	 $.ajax({
		url :'/custom_udel/'+bno,
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
                       <tr><th>물품명</th><th>상세정보</th><th>수량</th><th>가격</th><th>진행 상태</th><th>주문 취소</th></tr>
                        <c:forEach var="list" items="${customUser }">
                        <tr>
                          <td class="mailbox-subject">${list.cutitle }</td>
                          <td class="mailbox-name">${list.cuinfo }</td>
                          <td class="mailbox-name">${list.bcount }</td>
                          <td class="mailbox-name">${list.cuprice }</td>
                          <td class="mailbox-name">${list.bstate}</td>
                          <td class="mailbox-date"><input type="button" value="주문취소" class="remove_cusUser" data_bno="${list.bno}"></td>
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
                           <c:if test="${cusUser_maker.prev}">
                              <li><a
                                 href="mypage${cusUser_maker.makeQuery(cusUser_maker.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${cusUser_maker.startPage }"
                              end="${cusUser_maker.endPage }" var="idx">
                              <li
                                 <c:out value="${select10 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${cusUser_maker.makeQuery(idx)}&tab=customUser">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${cusUser_maker.next && cusUser_maker.endPage > 0}">
                              <li><a
                                 href="mypage${cusUser_maker.makeQuery(cusUser_maker.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->