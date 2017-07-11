<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

$(function(){
	$('.removeCare').click(function(){
	var cano = $(this).attr('data_cano');
	alert('삭제하시겠습니까?');
	$.ajax({
		url : '/care_delete/'+cano,
		type : 'delete',
		success : function(result){
			alert('삭제 완료!')
			window.location.reload();
		}
	});
	});
});
</script>

<div class="container">
	<div class="row" style="width: 800px">
		<div class="box-body no-padding">
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                       <tr><th>훈련 종류</th><th>훈련 내용</th><th>진행 상태</th><th>훈련 취소</th></tr>
                        <c:forEach var="list" items="${care }">
                        <tr>
                          <td class="mailbox-subject">${list.ctype }</td>
                          <td class="mailbox-name">${list.ccontent }</td>
                          <td class="mailbox-attachment">${list.castate }</td>
                          <td class="mailbox-date"><input type="button" value="취소" class="removeCare" data_cano=${list.cano }> </td>
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
                           <c:if test="${carePage.prev}">
                              <li><a
                                 href="mypage${carePage.makeQuery(carePage.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${carePage.startPage }"
                              end="${carePage.endPage }" var="idx">
                              <li
                                 <c:out value="${select2 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${carePage.makeQuery(idx)}&tab=training">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${carePage.next && carePage.endPage > 0}">
                              <li><a
                                 href="mypage${carePage.makeQuery(carePage.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->