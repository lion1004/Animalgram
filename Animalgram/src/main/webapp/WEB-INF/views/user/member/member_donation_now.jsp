<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(function(){
		$('.dno_del').on('click',function(){
			var dno = $(this).attr("data_dno");
			var dano = $('.dano_up').attr("data_dano");
			if(dno != dano ){
			alert('삭제 하시겠습니까?');
			 $.ajax({
				url : '/donation_del/'+dno,
				type : 'delete',
				success : function(result){
					alert('삭제 완료!')
					window.location.reload();
				}
			});//ajax
			}else{
				alert('당첨자가 있어 삭제할 수 없습니다.');
			}
		});//클릭
		
		$('.dano_up').on('click',function(){
			var dano = $('.dano_up').attr("data_dano");
			alert('배송 하시겠습니까?');
			 $.ajax({
				url : '/donation_up/'+dano,
				type : 'put',
				success : function(result){
					alert('배송 완료!')
					window.location.reload();
				}
			});//ajax
		});//클릭
		
	});// ready

	function pro_delete(no)
	{
		alert(no);
   }
</script>

<div class="container">
	<div class="row" style="width: 800px">
		<div class="box-body no-padding">
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody style="text-align: center">
                       <tr align="center"><th>나눔 제목</th><th>나눔 내용</th><th>등록일</th><th>진행 상황</th><th>나눔 삭제</th></tr>
                        <c:forEach var="list" items="${donation_now }">
                        <tr>
                          <td class="mailbox-subject">${list.dtitle }</td>
                          <td class="mailbox-subject">${list.dinfo }</td>
                          <td class="mailbox-name">${list.ddate}</td>
                          <td class="mailbox-attachment">${list.dstate }</td>
 	                         <td class="mailbox-date"><input type="button" value="삭제" class="dno_del" data_dno="${list.dno}" ></td>
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
                           <c:if test="${donation_page.prev}">
                              <li><a
                                 href="mypage${donation_page.makeQuery(donation_page.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${donation_page.startPage }"
                              end="${donation_page.endPage }" var="idx">
                              <li
                                 <c:out value="${select11 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${donation_page.makeQuery(idx)}&tab=donation_now">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${donation_page.next && donation_page.endPage > 0}">
                              <li><a
                                 href="mypage${donation_page.makeQuery(donation_page.endPage +1) }">&raquo;</a></li>
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
			                       <tr><th>나눔 제목</th><th>나눔 정보</th><th>신청 메모</th><th>신청자 주소</th><th>신청 상태</th><th>배송 승인</th></tr>
			                        <c:forEach var="list" items="${donation_check }">
			                        <tr>
			                          <td class="mailbox-subject">${list.dtitle }</td>
			                          <td class="mailbox-subject">${list.dinfo }</td>
			                          <td class="mailbox-name">${list.damemo }</td>
			                          <td class="mailbox-attachment">${list.maddr.split('/')[1] }</td>
			                          <td class="mailbox-attachment">${list.dastate }</td>
			                          <td class="mailbox-date"><input type="button" value="승인" class="dano_up" data_dano="${list.dano}" ></td>
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
                           <c:if test="${donation_check_maker.prev}">
                              <li><a
                                 href="mypage${donation_check_maker.makeQuery(donation_check_maker.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${donation_check_maker.startPage }"
                              end="${donation_check_maker.endPage }" var="idx">
                              <li
                                 <c:out value="${select12 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${donation_check_maker.makeQuery(idx)}&tab=donation_check">${idx}</a>
                              </li>
                           </c:forEach>
                    <c:if test="${donation_check_maker.next && donation_check_maker.endPage > 0}">
                              <li><a
                                 href="mypage${donation_check_maker.makeQuery(donation_check_maker.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
                </div>
            </div><!-- /.col -->