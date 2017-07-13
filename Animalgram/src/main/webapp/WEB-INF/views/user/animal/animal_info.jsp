<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrapPro/css/animal_confirm.css?ver=1.3">

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
            
            <c:forEach begin="0" end="10" items="${list }" var="list">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="/resources/upload/${list.nickname }/${list.aimage}" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>
                            My Pet</h4>
                         <i class="glyphicon glyphicon-user"></i>
                        ${list.nickname } <small style = "display: inline-block;">님의 펫 정보 </small>
                        <p>
                            <i class="glyphicon glyphicon-heart"></i>${list.aname } 
                            <br />
                            <i class="glyphicon glyphicon-grain"></i>${list.agender }
                            <br />
                            <i class="glyphicon glyphicon-certificate"></i>${list.aage } 살
                            <br />
                            <i class="glyphicon glyphicon-star-empty"></i>${list.atype } </p>
                        <!-- Split button -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span><span class="sr-only">Social</span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Twitter</a></li>
                                <li><a href="https://plus.google.com/+Jquery2dotnet/posts">Google +</a></li>
                                <li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Github</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <br><br>
             </c:forEach>   
                
                
            </div>
        </div>
    </div>
</div>
