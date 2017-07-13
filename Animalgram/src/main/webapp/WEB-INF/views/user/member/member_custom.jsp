<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

/*  $(function(){
	$('.remove_sel').click(function(){
	var cuno = $(this).attr('data_cuno');
		alert($(this).attr('data_cuno'));
	 alert('삭제하시겠습니까?');
	 $.ajax({
		url :'/custom_delete/'+cuno,
		type :'delete',
		success : function(result){
			alert('삭제 완료!')
			location.href='/member/mypage';
		}
	});	// ajax
	});	// click
}); // ready */
</script>

<div class="container">
	<div class="row" style="width: 800px">
		<div class="box-body no-padding">
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                       <tr><th>물품 제목</th><th>가격</th><th>물품 정보</th><th>자세히 보기</th></tr>
                        <c:forEach var="list" items="${custom_sel }">
                        <tr>
                          <td class="mailbox-subject">${list.ctitle }</td>
                          <td class="mailbox-name">${list.cprice }</td>
                          <td class="mailbox-name">${list.cinfo }</td>
                          <td class="mailbox-date"><input type="button" value="보러가기" class="remove_sel"  data_cuno="${list.cuno}"></td>
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
                           <c:if test="${custom_page.prev}">
                              <li><a
                                 href="mypage${custom_page.makeQuery(custom_page.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${custom_page.startPage }"
                              end="${custom_page.endPage }" var="idx">
                              <li
                                 <c:out value="${select6 == idx?'class =active':''}"/>>
                                 <a class="care_page" href="mypage${custom_page.makeQuery(idx)}&tab=custom_sel">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${custom_page.next && custom_page.endPage > 0}">
                              <li><a
                                 href="mypage${custom_page.makeQuery(custom_page.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->