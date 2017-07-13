<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

 $(function(){
	$('.update_bill').click(function(){
	var bno = $(this).attr('data_bno');
	 alert('수령하시겠습니까?');
	 $.ajax({
		url :'/bill_update/'+bno,
		type :'put',
		success : function(result){
			alert('주문 수령 완료!')
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
                       <tr><th>물품 제목</th><th>물품 정보</th><th>수량</th><th>주문 날짜</th><th>물품 현황</th><th>주문 확인</th></tr>
                        <c:forEach var="list" items="${bill_sel }">
                        <tr>
                          <td class="mailbox-subject">${list.ctitle }</td>
                          <td class="mailbox-name">${list.bmeno }</td>
                          <td class="mailbox-name">${list.bcount }</td>
                          <td class="mailbox-name">${list.bdate }</td>
                          <td class="mailbox-name">${list.bstate }</td>
                          <td class="mailbox-date"><input type="button" value="주문 완료" class="update_bill" data_bno=${list.bno }></td>
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
                           <c:if test="${bill_page.prev}">
                              <li><a
                                 href="mypage${bill_page.makeQuery(bill_page.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${bill_page.startPage }"
                              end="${bill_page.endPage }" var="idx">
                              <li
                                 <c:out value="${select7 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${bill_page.makeQuery(idx)}&tab=bill_sel">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${bill_page.next && bill_page.endPage > 0}">
                              <li><a
                                 href="mypage${bill_page.makeQuery(bill_page.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
                <br>
                <hr>
                <br>
                <div class="box-body no-padding">
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                       <tr><th>물품 제목</th><th>물품 정보</th><th>수량</th><th>주문 날짜</th><th>물품 현황</th></tr>
                        <c:forEach var="list" items="${bill_comit_sel }">
                        <tr>
                          <td class="mailbox-subject">${list.ctitle }</td>
                          <td class="mailbox-name">${list.bmeno }</td>
                          <td class="mailbox-name">${list.bcount }</td>
                          <td class="mailbox-name">${list.bdate }</td>
                          <td class="mailbox-name">${list.bstate }</td>
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
                           <c:if test="${bill_comit_page.prev}">
                              <li><a
                                 href="mypage${bill_comit_page.makeQuery(bill_comit_page.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${bill_comit_page.startPage }"
                              end="${bill_comit_page.endPage }" var="idx">
                              <li
                                 <c:out value="${select8 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${bill_comit_page.makeQuery(idx)}&tab=bill_comit_sel">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${bill_comit_page.next && bill_comit_page.endPage > 0}">
                              <li><a
                                 href="mypage${bill_comit_page.makeQuery(bill_comit_page.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->