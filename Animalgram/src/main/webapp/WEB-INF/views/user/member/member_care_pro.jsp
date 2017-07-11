<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	$(function(){
		$('.pro_up').on('click',function(){
			var no = $(this).attr("data_cano");
			alert('승인 하시겠습니까?');
			 $.ajax({
				url : '/care_pro_update/'+no,
				type : 'put',
				success : function(result){
					alert('승인 완료!')
					location.href='/member/mypage';
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
                      <tbody>
                       <tr><th></th><th>훈련 종류</th><th>훈련 내용</th><th>신청자</th><th>예약 날짜</th><th>진행 상황</th><th>훈련 승인</th></tr>
                        <c:forEach var="list" items="${care_pro }">
                        <tr>
                        <td><input type="text" value="${list.cano }" class="cano" size="1"></td>
                          <td class="mailbox-subject">${list.ctype }</td>
                          <td class="mailbox-name">${list.ccontent }</td>
                          <td class="mailbox-attachment">${list.nickname }</td>
                          <td class="mailbox-attachment">${list.cadate }</td>
                          <td class="mailbox-attachment">${list.castate }</td>
 	                         <td class="mailbox-date"><input type="button" value="승인" class="pro_up" data_cano="${list.cano}" > </td>
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
                           <c:if test="${care_proPage.prev}">
                              <li><a
                                 href="mypage${care_proPage.makeQuery(care_proPage.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${care_proPage.startPage }"
                              end="${care_proPage.endPage }" var="idx">
                              <li
                                 <c:out value="${select4 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${care_proPage.makeQuery(idx)}&tab=training_pro">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${care_proPage.next && care_proPage.endPage > 0}">
                              <li><a
                                 href="mypage${care_proPage.makeQuery(care_proPage.endPage +1) }">&raquo;</a></li>
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
			                       <tr><th></th><th>훈련 종류</th><th>훈련 내용</th><th>신청자</th><th>예약 날짜</th><th>진행 상황</th></tr>
			                        <c:forEach var="list" items="${care_comit }">
			                        <tr>
			                        <td><input type="text" value="${list.cano }" class="cano" size="1"></td>
			                          <td class="mailbox-subject">${list.ctype }</td>
			                          <td class="mailbox-name">${list.ccontent }</td>
			                          <td class="mailbox-attachment">${list.nickname }</td>
			                          <td class="mailbox-attachment">${list.cadate }</td>
			                          <td class="mailbox-attachment">${list.castate }</td>
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
                           <c:if test="${care_comitPage.prev}">
                              <li><a
                                 href="mypage${care_comitPage.makeQuery(care_comitPage.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${care_comitPage.startPage }"
                              end="${care_comitPage.endPage }" var="idx">
                              <li
                                 <c:out value="${select5 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${care_comitPage.makeQuery(idx)}&tab=training_pro_comit">${idx}</a>
                              </li>
                           </c:forEach>
                    <c:if test="${care_comitPage.next && care_comitPage.endPage > 0}">
                              <li><a
                                 href="mypage${care_comitPage.makeQuery(care_comitPage.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
                </div>
            </div><!-- /.col -->