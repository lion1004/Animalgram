<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row" style="width: 800px">
		<div class="box-body no-padding">
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                       <tr><th>관심 모임</th><th>모임 이름</th><th>모임 장소</th><th>소모임 종류</th><th>진행 상태</th></tr>
                        <c:forEach var="list" items="${agroup }">
                        <tr>
                          <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                          <td class="mailbox-subject">${list.gtitle }</td>
                          <td class="mailbox-name">${list.gplace }</td>
                          <td class="mailbox-attachment">${list.gtype }</td>
                          <td class="mailbox-date">${list.gstate }</td>
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
                           <c:if test="${pageMaker.prev}">
                              <li><a
                                 href="mypage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
                           </c:if>
                           <c:forEach begin="${pageMaker.startPage }"
                              end="${pageMaker.endPage }" var="idx">
                              <li
                                 <c:out value="${select1 == idx?'class =active':''}"/>>
                                 <a href="mypage${pageMaker.makeQuery(idx)}&tab=matching">${idx}</a>
                              </li>
                           </c:forEach>
                           <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                              <li><a
                                 href="mypage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->