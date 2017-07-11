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
                       <tr><th>훈련 종류</th><th>훈련 내용</th><th>훈련 삭제</th></tr>
                        <c:forEach var="list" items="${care_select_pro }">
                        <tr>
                          <td class="mailbox-subject">${list.ctype }</td>
                          <td class="mailbox-name">${list.ccontent }</td>
                          <td class="mailbox-date"><input type="button" value="삭제" class="remove_proSel" data_cno="${list.cno}"></td>
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
                           <c:if test="${care_select_proPage.prev}">
                              <li><a
                                 href="mypage${care_select_proPage.makeQuery(care_select_proPage.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${care_select_proPage.startPage }"
                              end="${care_select_proPage.endPage }" var="idx">
                              <li
                                 <c:out value="${select3 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${care_select_proPage.makeQuery(idx)}&tab=training_select_pro">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${care_select_proPage.next && care_select_proPage.endPage > 0}">
                              <li><a
                                 href="mypage${care_select_proPage.makeQuery(care_select_proPage.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->